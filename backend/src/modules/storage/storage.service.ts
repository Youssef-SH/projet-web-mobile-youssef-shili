import { Injectable, Logger } from '@nestjs/common';
import { ConfigService } from '@nestjs/config';
import { createClient, SupabaseClient } from '@supabase/supabase-js';
import * as path from 'path';
import * as crypto from 'crypto';

import { UserRole } from '../../common/enums/user-role.enum';
import { MAX_UPLOAD_BYTES } from '../../config/upload-limits';
import {
  forbidden,
  internal,
  validationError,
} from '../../common/utils/fail.util';

@Injectable()
export class StorageService {
  private readonly logger = new Logger(StorageService.name);

  private readonly client: SupabaseClient;
  private readonly bucket: string;
  private readonly maxBytes: number;
  private readonly signedUrlTtl: number;
  private readonly publicPrefixes: Set<string>;

  private readonly imgMimes = new Set([
    'image/jpeg',
    'image/png',
    'image/webp',
    'image/gif',
  ]);
  private readonly pdfMimes = new Set(['application/pdf']);

  constructor(private readonly config: ConfigService) {
    const url = this.config.getOrThrow<string>('SUPABASE_URL');
    const serviceKey = this.config.getOrThrow<string>('SUPABASE_SERVICE_KEY');

    this.bucket = this.config.getOrThrow<string>('SUPABASE_BUCKET');
    this.maxBytes = MAX_UPLOAD_BYTES;

    const rawTtl = Number(
      this.config.get<string>('SUPABASE_SIGNED_URL_TTL', '3600'),
    );

    this.signedUrlTtl = Number.isFinite(rawTtl) && rawTtl > 0 ? rawTtl : 3600;

    this.client = createClient(url, serviceKey);

    this.publicPrefixes = new Set(
      (this.config.get<string>('STORAGE_PUBLIC_PREFIXES') || '')
        .split(',')
        .map((p) => p.trim())
        .filter(Boolean),
    );
  }

  // ─────────── CLUB LOGOS ───────────

  async uploadClubLogo(
    clubId: string,
    file: Express.Multer.File,
    actorRole: UserRole,
  ): Promise<{ key: string; publicUrl: string }> {
    this.ensureClub(actorRole);
    this.ensureFileOk(file, this.imgMimes);

    const key = `clubs/logos/${clubId}/${this.uuid()}${this.safeExt(file.originalname)}`;
    await this.put(key, file.buffer, file.mimetype);

    const publicUrl = this.getPublicUrl(key);
    if (!publicUrl) {
      await this.remove([key]).catch(() => undefined);
      internal('Logo public URL not resolvable');
    }

    this.logAction('UPLOAD_LOGO', actorRole, key, publicUrl);
    return { key, publicUrl };
  }

  // ─────────── POSTS ───────────

  async uploadPostMedia(
    clubId: string,
    file: Express.Multer.File,
    actorRole: UserRole,
    now = new Date(),
  ): Promise<string> {
    this.ensureClub(actorRole);
    this.ensureFileOk(file, this.imgMimes);

    const ym = `${now.getUTCFullYear()}${String(now.getUTCMonth() + 1).padStart(2, '0')}`;
    const key = `clubs/posts/${clubId}/${ym}/${this.uuid()}${this.safeExt(file.originalname)}`;

    await this.put(key, file.buffer, file.mimetype);

    const publicUrl = this.getPublicUrl(key);
    if (!publicUrl) {
      await this.remove([key]).catch(() => undefined);
      internal('Post media public URL not resolvable');
    }

    this.logAction('UPLOAD_POST_MEDIA', actorRole, key, publicUrl);
    return publicUrl;
  }

  async deletePostMedia(
    clubId: string,
    mediaKey: string,
    actorRole: UserRole,
  ): Promise<void> {
    this.ensureClub(actorRole);
    this.validatePrefix(mediaKey, [`clubs/posts/${clubId}/`]);
    await this.remove([mediaKey]);
    this.logAction('DELETE_POST_MEDIA', actorRole, mediaKey);
  }

  // ─────────── ANNEXES / TEMPLATES (PRIVATE) ───────────

  async uploadAnnexTemplate(
    annexNumber: number,
    slug: string,
    file: Express.Multer.File,
    actorRole: UserRole,
    nextVersion: number,
  ): Promise<string> {
    this.ensureAdmin(actorRole);
    this.ensureFileOk(file, this.pdfMimes);

    const safeSlug = this.slugify(slug || 'template');
    const key = `templates/${annexNumber}-${safeSlug}_v${nextVersion}.pdf`;

    await this.put(key, file.buffer, file.mimetype, { upsert: false });
    this.logAction('UPLOAD_ANNEX_TEMPLATE', actorRole, key);

    return key;
  }

  async uploadAnnex(
    requestId: string,
    templateId: string,
    file: Express.Multer.File,
    actorRole: UserRole,
  ): Promise<string> {
    this.ensureClub(actorRole);
    this.ensureFileOk(file, this.pdfMimes);

    const ext =
      this.safeExt(file.originalname) || this.defaultExtFor(file.mimetype);
    const key = `annexes/${requestId}/${templateId}/${this.uuid()}${ext}`;

    await this.put(key, file.buffer, file.mimetype, { upsert: false });
    this.logAction('UPLOAD_ANNEX', actorRole, key);

    return key;
  }

  async signAnnex(objectKey: string, actorRole: UserRole): Promise<string> {
    this.ensureAdmin(actorRole);
    const signed = await this.sign(objectKey, this.signedUrlTtl);
    if (!signed) internal('Cannot sign annex');
    return signed;
  }

  // ─────────── REPORTS (BYTES ONLY) ───────────

  // actorRole is passed for audit/logging context.
  // Business authorization is handled upstream.
  async saveAnnualReportByKey(
    reportKey: string,
    pdf: Buffer,
    actorRole: UserRole,
    overwrite = true,
  ): Promise<void> {
    if (
      !reportKey.startsWith('reports/clubs/') &&
      !reportKey.startsWith('reports/global/')
    ) {
      validationError('Validation failed', {
        objectKey: ['Invalid report key'],
      });
    }

    await this.put(reportKey, pdf, 'application/pdf', { upsert: overwrite });
    this.logAction(
      reportKey.startsWith('reports/global/')
        ? 'SAVE_GLOBAL_REPORT'
        : 'SAVE_CLUB_REPORT',
      actorRole,
      reportKey,
    );
  }

  // Context parameters (actorRole, clubId) are intentionally passed through
  // for upcoming AuditLog integration.
  // Authorization is enforced at the service layer (ClubsService).
  // StorageService is I/O-only and does not perform access control.
  async downloadReport(
    objectKey: string,
    actorRole: UserRole,
    clubId: string | null,
  ): Promise<Buffer> {
    // TODO: Replace with streaming when reports exceed safe memory size
    if (
      !objectKey.startsWith('reports/clubs/') &&
      !objectKey.startsWith('reports/global/')
    ) {
      validationError('Validation failed', {
        objectKey: ['Invalid report key'],
      });
    }

    const { data, error } = await this.client.storage
      .from(this.bucket)
      .download(objectKey);
    if (error || !data) internal('Storage download failed');

    const anyData: any = data;

    if (typeof anyData.arrayBuffer === 'function') {
      const ab = await anyData.arrayBuffer();
      return Buffer.from(ab);
    }

    if (Buffer.isBuffer(anyData)) return anyData;
    if (anyData instanceof ArrayBuffer) return Buffer.from(anyData);

    internal('Storage download failed');

    throw new Error('Unreachable');
  }

  // ─────────── HELPERS ───────────

  getPublicUrl(key: string): string {
    if (![...this.publicPrefixes].some((p) => key.startsWith(p))) return '';
    const { data } = this.client.storage.from(this.bucket).getPublicUrl(key);
    return data?.publicUrl ?? '';
  }

  async deleteRawObject(keys: string[]): Promise<void> {
    if (!keys?.length) return;
    const { error } = await this.client.storage.from(this.bucket).remove(keys);
    if (error) internal('Storage delete failed');
  }

  private ensureClub(role: UserRole) {
    if (role !== UserRole.CLUB) forbidden('Forbidden');
  }

  private ensureAdmin(role: UserRole) {
    if (role !== UserRole.ADMIN) forbidden('Forbidden');
  }

  buildReportKey(clubId: string | null, year: number): string {
    return clubId === null
      ? `reports/global/${year}/summary.pdf`
      : `reports/clubs/${clubId}/${year}/report.pdf`;
  }

  private ensureFileOk(file: Express.Multer.File, allowed: Set<string>) {
    if (!file?.buffer?.length)
      validationError('Validation failed', { file: ['File is required'] });

    if (!allowed.has(file.mimetype))
      validationError('Unsupported file type', { mimetype: [file.mimetype] });

    if (file.size > this.maxBytes) {
      const mb = (this.maxBytes / 1024 / 1024).toFixed(0);
      validationError('Max upload size exceeded', {
        maxMb: [mb],
        size: [String(file.size)],
      });
    }
  }

  private validatePrefix(key: string, allowed: string[]) {
    if (!allowed.some((p) => key.startsWith(p))) forbidden('Forbidden');
  }

  private async put(
    key: string,
    bytes: Buffer,
    contentType: string,
    opts?: { upsert?: boolean },
  ) {
    const { error } = await this.client.storage
      .from(this.bucket)
      .upload(key, bytes, {
        contentType,
        upsert: !!opts?.upsert,
      });
    if (error) internal('Storage upload failed');
  }

  private async remove(keys: string[]) {
    const { error } = await this.client.storage.from(this.bucket).remove(keys);
    if (error) internal('Storage delete failed');
  }

  private async sign(key: string, ttl: number): Promise<string> {
    const { data, error } = await this.client.storage
      .from(this.bucket)
      .createSignedUrl(key, ttl);
    if (error || !data?.signedUrl) return '';
    return data.signedUrl;
  }

  private safeExt(name: string): string {
    const ext = path.extname(name || '').toLowerCase();
    return ext && ext.length <= 8 ? ext : '';
  }

  private defaultExtFor(mime: string): string {
    return mime === 'application/pdf' ? '.pdf' : '';
  }

  private slugify(s: string): string {
    return s
      .toLowerCase()
      .normalize('NFKD')
      .replace(/[\u0300-\u036f]/g, '')
      .replace(/[^a-z0-9]+/g, '-')
      .replace(/(^-|-$)/g, '');
  }

  private uuid(): string {
    return crypto.randomUUID();
  }

  private logAction(
    action: string,
    role: UserRole,
    key: string,
    extra?: string,
  ) {
    this.logger.log(
      `${action} by ${role} → ${key}${extra ? ` (${extra})` : ''}`,
    );
  }
}
