import { Injectable, Logger } from '@nestjs/common';
import { ConfigService } from '@nestjs/config';
import { InjectRepository } from '@nestjs/typeorm';
import { DataSource, IsNull, QueryRunner, Repository } from 'typeorm';

import { normalizeEmail } from '../../../common/utils/strings.util';
import {
  badRequest,
  forbidden,
  internal,
  notFound,
  validationError,
} from '../../../common/utils/fail.util';

import { Club } from '../entities/club.entity';
import { ClubLeader } from '../entities/club-leader.entity';
import { Subscription } from '../entities/subscription.entity';
import { AnnualReport } from '../entities/annual-report.entity';
import { Post } from '../../community/entities/post.entity';

import { ClubRole } from 'src/common/enums/club-role.enum';
import { StudyLevel } from 'src/common/enums/study-level.enum';
import { UserRole } from 'src/common/enums/user-role.enum';

import { StorageService } from 'src/modules/storage/storage.service';
import { DEFAULT_CLUB_LOGO_URL } from 'src/common/constants/club.constants';
import { validateClubLeadersInvariant } from 'src/common/validators/club-leaders.validator';

type AnnualReportResult = {
  clubId: string | null;
  year: number;
  generatedAt: string;
  filename: string;
  contentType: 'application/pdf';
  pdfBuffer: Buffer;
};

@Injectable()
export class ClubsService {
  private readonly logger = new Logger(ClubsService.name);

  constructor(
    @InjectRepository(Club) private readonly clubs: Repository<Club>,
    @InjectRepository(ClubLeader)
    private readonly leaders: Repository<ClubLeader>,
    @InjectRepository(Subscription)
    private readonly subscriptions: Repository<Subscription>,
    @InjectRepository(AnnualReport)
    private readonly reports: Repository<AnnualReport>,
    @InjectRepository(Post) private readonly posts: Repository<Post>,
    private readonly storage: StorageService,
    private readonly dataSource: DataSource,
    private readonly config: ConfigService,
  ) {}

  // ───────────────────────────────────────────────
  // Transaction + DB error helpers
  // ───────────────────────────────────────────────

  private async runInTransaction<T>(
    fn: (qr: QueryRunner) => Promise<T>,
  ): Promise<T> {
    const qr = this.dataSource.createQueryRunner();
    await qr.connect();
    await qr.startTransaction();
    try {
      const out = await fn(qr);
      await qr.commitTransaction();
      return out;
    } catch (err) {
      await qr.rollbackTransaction();
      throw err;
    } finally {
      await qr.release();
    }
  }

  private isPgUniqueViolation(err: any, constraintIncludes?: string): boolean {
    const code = err?.code ?? err?.driverError?.code;
    if (code !== '23505') return false;

    if (!constraintIncludes) return true;

    const constraint = (
      err?.constraint ??
      err?.driverError?.constraint ??
      ''
    ).toLowerCase();
    return constraint.includes(constraintIncludes.toLowerCase());
  }

  private extractSupabasePublicKey(
    publicUrl: string | null | undefined,
  ): string | null {
    if (!publicUrl) return null;

    const base = '/storage/v1/object/public/';
    const idx = publicUrl.indexOf(base);
    if (idx === -1) return null;

    const noQuery = publicUrl.split('?')[0];
    const after = noQuery.slice(idx + base.length);

    const parts = after.split('/').filter(Boolean);
    if (parts.length < 2) return null;

    parts.shift();
    return parts.join('/');
  }

  private coalesceLogoUrl(logoUrl: string | null | undefined): string {
    if (!logoUrl) return DEFAULT_CLUB_LOGO_URL;
    const trimmed = logoUrl.trim();
    return trimmed.length ? trimmed : DEFAULT_CLUB_LOGO_URL;
  }

  // ───────────────────────────────────────────────
  // Core helpers
  // ───────────────────────────────────────────────

  private async findClubByUserIdOrThrow(userId: string): Promise<Club> {
    const club = await this.clubs.findOne({ where: { userId } });
    if (!club) return notFound();
    return club;
  }

  private async findActiveClubOrThrow(clubId: string): Promise<Club> {
    const club = await this.clubs
      .createQueryBuilder('c')
      .innerJoin('c.user', 'u')
      .where('c.id = :clubId', { clubId })
      .andWhere('u.isActive = true')
      .select(['c.id', 'c.userId', 'c.name', 'c.description', 'c.logoUrl'])
      .getOne();

    if (!club) return notFound();
    return club;
  }

  private async findClubForAdminOrThrow(
    clubId: string,
  ): Promise<{ club: Club; isActive: boolean }> {
    const row = await this.clubs
      .createQueryBuilder('c')
      .innerJoin('c.user', 'u')
      .where('c.id = :clubId', { clubId })
      .select([
        'c.id AS "id"',
        'c.userId AS "userId"',
        'c.name AS "name"',
        'c.description AS "description"',
        'c.logoUrl AS "logoUrl"',
        'u.isActive AS "isActive"',
      ])
      .getRawOne<{
        id: string;
        userId: string;
        name: string;
        description: string;
        logoUrl: string;
        isActive: boolean;
      }>();

    if (!row) return notFound();

    const club = Object.assign(new Club(), {
      id: row.id,
      userId: row.userId,
      name: row.name,
      description: row.description,
      logoUrl: row.logoUrl,
    });

    return { club, isActive: !!row.isActive };
  }

  // ───────────────────────────────────────────────
  // 1) GET /clubs
  // ───────────────────────────────────────────────

  async listClubs(): Promise<
    Array<{ id: string; name: string; logoUrl: string }>
  > {
    const rows = await this.clubs
      .createQueryBuilder('c')
      .innerJoin('c.user', 'u')
      .where('u.isActive = true')
      .select(['c.id AS id', 'c.name AS name', 'c.logoUrl AS "logoUrl"'])
      .getRawMany<{ id: string; name: string; logoUrl: string }>();

    this.logger.debug(`[listClubs] returned ${rows.length} clubs`);
    return rows.map((r) => ({
      id: r.id,
      name: r.name,
      logoUrl: this.coalesceLogoUrl(r.logoUrl),
    }));
  }

  // ───────────────────────────────────────────────
  // 2) GET /clubs/:id
  // ───────────────────────────────────────────────

  async getClubHeader(
    clubId: string,
    opts?: { userId?: string; isAdmin?: boolean; isStudent?: boolean },
  ): Promise<{
    id: string;
    name: string;
    description: string;
    logoUrl: string;
    followerCount: number;
    postCount: number;
    isFollowed?: boolean;
    isActive?: boolean;
  }> {
    const { userId, isAdmin, isStudent } = opts ?? {};

    if (isAdmin && isStudent)
      badRequest('Requester cannot be both admin and student.');
    if (isStudent && !userId) badRequest('Student context requires userId.');

    let club: Club;
    let adminVisibleActiveFlag = true;

    if (isAdmin) {
      const { club: adminClub, isActive } =
        await this.findClubForAdminOrThrow(clubId);
      club = adminClub;
      adminVisibleActiveFlag = isActive;
    } else {
      club = await this.findActiveClubOrThrow(clubId);
    }

    const [followerCount, postCount] = await Promise.all([
      this.subscriptions.count({ where: { club: { id: club.id } } }),
      this.posts.count({ where: { clubId: club.id } }),
    ]);

    let isFollowed = false;
    if (isStudent && userId) {
      isFollowed = await this.subscriptions.exist({
        where: { club: { id: club.id }, student: { id: userId } },
      });
    }

    return {
      id: club.id,
      name: club.name,
      description: club.description,
      logoUrl: this.coalesceLogoUrl(club.logoUrl),
      followerCount,
      postCount,
      ...(isStudent && { isFollowed }),
      ...(isAdmin && { isActive: adminVisibleActiveFlag }),
    };
  }

  // ───────────────────────────────────────────────
  // 3) GET /clubs/me
  // ───────────────────────────────────────────────

  async getOwnClubProfile(clubUserId: string): Promise<{
    id: string;
    name: string;
    description: string;
    logoUrl: string;
    minReportAyStart: number;
    currentAyStart: number;
    leaders: Array<{
      id: string;
      role: ClubRole;
      fullName: string;
      email: string;
      phone: string;
      cin: string;
      studyLevel: StudyLevel;
      specialization: string;
    }>;
  }> {
    const club = await this.clubs.findOne({
      where: { userId: clubUserId },
      relations: ['leaders'],
    });
    if (!club) return notFound();

    const now = new Date();
    const currentAyStart = this.currentAcademicYearStartUtc(now);
    const minReportAyStart = await this.minAcademicYearStartForClub(club.id);

    return {
      id: club.id,
      name: club.name,
      description: club.description,
      logoUrl: this.coalesceLogoUrl(club.logoUrl),
      minReportAyStart,
      currentAyStart,
      leaders: (club.leaders ?? []).map((l) => ({
        id: l.id,
        role: l.role,
        fullName: l.fullName,
        email: l.email ?? '',
        phone: l.phone ?? '',
        cin: l.cin ?? '',
        studyLevel: l.studyLevel ?? StudyLevel.CPI1,
        specialization: l.specialization ?? '',
      })),
    };
  }

  // ───────────────────────────────────────────────
  // 4) PATCH /clubs/me
  // ───────────────────────────────────────────────

  async updateClubProfile(
    clubUserId: string,
    input: { description?: string },
    logo?: Express.Multer.File,
  ): Promise<{ description: string; logoUrl: string }> {
    const club = await this.findClubByUserIdOrThrow(clubUserId);

    const hasDesc = typeof input.description === 'string';
    const hasLogo = !!logo;

    if (!hasDesc && !hasLogo) {
      return {
        description: club.description,
        logoUrl: this.coalesceLogoUrl(club.logoUrl),
      };
    }

    const previousLogoUrl = club.logoUrl;
    let uploaded: { key: string; publicUrl: string } | null = null;

    if (hasLogo)
      uploaded = await this.storage.uploadClubLogo(
        club.id,
        logo,
        UserRole.CLUB,
      );

    try {
      const saved = await this.runInTransaction(async (qr) => {
        const locked = await qr.manager
          .createQueryBuilder(Club, 'c')
          .setLock('pessimistic_write')
          .where('c.id = :id', { id: club.id })
          .getOne();

        if (!locked) return notFound();

        if (hasDesc) {
          const v = input.description!.trim();
          if (!v)
            validationError('Validation failed', {
              description: ['Cannot be empty'],
            });
          locked.description = v;
        }

        if (uploaded) locked.logoUrl = uploaded.publicUrl;

        return qr.manager.save(locked);
      });

      if (uploaded) {
        const oldKey = this.extractSupabasePublicKey(previousLogoUrl);
        if (
          oldKey &&
          previousLogoUrl !== DEFAULT_CLUB_LOGO_URL &&
          oldKey !== uploaded.key
        ) {
          await this.storage.deleteRawObject([oldKey]).catch(() => undefined);
        }
      }

      return {
        description: saved.description,
        logoUrl: this.coalesceLogoUrl(saved.logoUrl),
      };
    } catch (err) {
      if (uploaded?.key)
        await this.storage
          .deleteRawObject([uploaded.key])
          .catch(() => undefined);
      throw err;
    }
  }

  // ───────────────────────────────────────────────
  // 5) PUT /clubs/me/leaders
  // ───────────────────────────────────────────────

  async replaceClubLeaders(
    clubUserId: string,
    input: {
      leaders: Array<{
        role: ClubRole;
        fullName: string;
        email: string;
        phone: string;
        cin: string;
        studyLevel: StudyLevel;
        specialization: string;
      }>;
    },
  ): Promise<{
    leaders: Array<{
      id: string;
      role: ClubRole;
      fullName: string;
      email: string;
      phone: string;
      cin: string;
      studyLevel: StudyLevel;
      specialization: string;
    }>;
  }> {
    const club = await this.findClubByUserIdOrThrow(clubUserId);

    const incoming = input.leaders ?? [];
    validateClubLeadersInvariant(incoming as any);

    const saved = await this.runInTransaction(async (qr) => {
      await qr.manager.delete(ClubLeader, { club: { id: club.id } } as any);

      const entities = incoming.map((l) =>
        qr.manager.create(ClubLeader, {
          club: { id: club.id },
          role: l.role,
          fullName: (l.fullName ?? '').trim(),
          email: normalizeEmail(l.email),
          phone: (l.phone ?? '').trim(),
          cin: (l.cin ?? '').trim(),
          studyLevel: l.studyLevel ?? StudyLevel.CPI1,
          specialization: (l.specialization ?? '').trim(),
        }),
      );

      const out: ClubLeader[] = [];
      for (const e of entities) out.push(await qr.manager.save(e));
      return out;
    });

    saved.sort((a, b) => a.role.localeCompare(b.role));
    this.logger.log(`Club ${club.id} replaced its leaders.`);

    return {
      leaders: saved.map((l) => ({
        id: l.id,
        role: l.role,
        fullName: l.fullName,
        email: l.email ?? '',
        phone: l.phone ?? '',
        cin: l.cin ?? '',
        studyLevel: l.studyLevel ?? StudyLevel.CPI1,
        specialization: l.specialization ?? '',
      })),
    };
  }

  // ───────────────────────────────────────────────
  // 6) GET /clubs/:id/leaders
  // ───────────────────────────────────────────────

  async getClubLeaders(
    clubId: string,
    opts?: { requireActive?: boolean },
  ): Promise<{
    clubId: string;
    leaders: Array<{
      role: ClubRole;
      fullName: string;
      email: string;
      phone: string;
      cin: string;
      studyLevel: StudyLevel;
      specialization: string;
    }>;
  }> {
    if (opts?.requireActive) {
      await this.findActiveClubOrThrow(clubId);
    } else {
      const clubExists = await this.clubs.exist({ where: { id: clubId } });
      if (!clubExists) return notFound();
    }

    const leaders = await this.leaders.find({
      where: { club: { id: clubId } },
      order: { role: 'ASC' },
    });

    return {
      clubId,
      leaders: leaders.map((l) => ({
        role: l.role,
        fullName: l.fullName,
        email: l.email ?? '',
        phone: l.phone ?? '',
        cin: l.cin ?? '',
        studyLevel: l.studyLevel ?? StudyLevel.CPI1,
        specialization: l.specialization ?? '',
      })),
    };
  }

  // ───────────────────────────────────────────────
  // 7–9) follow/unfollow, rename
  // ───────────────────────────────────────────────

  async followClub(
    studentId: string,
    clubId: string,
  ): Promise<{ clubId: string; isFollowed: boolean }> {
    await this.findActiveClubOrThrow(clubId);

    const already = await this.subscriptions.findOne({
      where: { student: { id: studentId }, club: { id: clubId } },
    });
    if (!already) {
      try {
        await this.subscriptions.save({
          student: { id: studentId },
          club: { id: clubId },
        } as any);
      } catch (err: any) {
        if (!this.isPgUniqueViolation(err)) throw err;
        this.logger.warn(
          `Race on followClub for club ${clubId} / student ${studentId}`,
        );
      }
    }

    return { clubId, isFollowed: true };
  }

  async unfollowClub(
    studentId: string,
    clubId: string,
  ): Promise<{ clubId: string; isFollowed: boolean }> {
    await this.findActiveClubOrThrow(clubId);
    await this.subscriptions.delete({
      student: { id: studentId },
      club: { id: clubId },
    } as any);
    return { clubId, isFollowed: false };
  }

  async renameClub(
    adminId: string,
    clubId: string,
    name: string,
  ): Promise<{ id: string; name: string }> {
    const club = await this.clubs.findOne({ where: { id: clubId } });
    if (!club) return notFound();

    const newName = (name ?? '').trim();
    if (!newName)
      validationError('Validation failed', {
        name: ['Club name cannot be empty'],
      });

    const oldName = club.name;
    club.name = newName;

    await this.clubs.save(club);

    this.logger.log(
      `Admin ${adminId} renamed club ${clubId} from "${oldName}" to "${newName}"`,
    );
    return { id: club.id, name: club.name };
  }

  // ───────────────────────────────────────────────
  // REPORTS
  // ───────────────────────────────────────────────

  private currentAcademicYearStartUtc(now: Date): number {
    const y = now.getUTCFullYear();
    const m = now.getUTCMonth();
    return m >= 8 ? y : y - 1;
  }

  private academicYearStartUtcFromDate(d: Date): number {
    const y = d.getUTCFullYear();
    const m = d.getUTCMonth();
    return m >= 8 ? y : y - 1;
  }

  private platformLaunchAcademicYearStart(): number {
    const raw =
      this.config.get<string>('PLATFORM_LAUNCH_AY_START') ??
      this.config.get<string>('PLATFORM_LAUNCH_ACADEMIC_YEAR_START') ??
      '';

    const n = Number(raw);
    if (Number.isInteger(n) && n >= 2000 && n <= 2100) return n;

    if ((process.env.NODE_ENV ?? '').toLowerCase() === 'production') {
      throw new Error('Missing/invalid PLATFORM_LAUNCH_AY_START');
    }

    return this.currentAcademicYearStartUtc(new Date());
  }

  private async minAcademicYearStartForClub(clubId: string): Promise<number> {
    const row = await this.clubs
      .createQueryBuilder('c')
      .innerJoin('c.user', 'u')
      .where('c.id = :clubId', { clubId })
      .select(['u.createdAt AS "createdAt"'])
      .getRawOne<{ createdAt: any }>();

    const createdAt = row?.createdAt ? new Date(row.createdAt) : null;
    if (!createdAt || Number.isNaN(createdAt.getTime()))
      return this.currentAcademicYearStartUtc(new Date());

    return this.academicYearStartUtcFromDate(createdAt);
  }

  private async validateReportYearRangeOrThrow(
    targetClubId: string | null,
    ayStart: number,
  ) {
    const now = new Date();
    const current = this.currentAcademicYearStartUtc(now);

    const min = targetClubId
      ? await this.minAcademicYearStartForClub(targetClubId)
      : this.platformLaunchAcademicYearStart();

    if (ayStart < min)
      validationError('Validation failed', {
        year: [`Year must be >= ${min}`],
      });
    if (ayStart > current)
      validationError('Validation failed', {
        year: ['Future academic year is not allowed'],
      });
  }

  private normalizeRequestedAcademicYearStart(input: any, now: Date): number {
    const current = this.currentAcademicYearStartUtc(now);

    if (input === undefined || input === null || input === '') return current;

    const n = Number(input);
    if (!Number.isFinite(n) || !Number.isInteger(n))
      validationError('Validation failed', {
        year: ['Year must be an integer'],
      });
    if (n > current)
      validationError('Validation failed', {
        year: ['Future academic year is not allowed'],
      });

    return n;
  }

  private cutoffUtcForAcademicYearStart(ayStart: number): Date {
    return new Date(Date.UTC(ayStart + 1, 6, 31, 23, 59, 59, 999));
  }

  private shouldPersistReport(requestedAyStart: number, now: Date): boolean {
    const current = this.currentAcademicYearStartUtc(now);
    if (requestedAyStart < current) return true;
    return (
      now.getTime() >
      this.cutoffUtcForAcademicYearStart(requestedAyStart).getTime()
    );
  }

  private reportFilename(clubId: string | null, ayStart: number): string {
    const label = `${ayStart}-${ayStart + 1}`;
    return clubId
      ? `club-report_${clubId}_${label}.pdf`
      : `global-report_${label}.pdf`;
  }

  private async sleep(ms: number): Promise<void> {
    await new Promise((resolve) => setTimeout(resolve, ms));
  }

  private async tryDownloadPersistedReport(
    report: AnnualReport,
    requesterRole: UserRole,
    requesterClubId: string | null,
  ): Promise<Buffer | null> {
    const maxAttempts = 3;
    const baseDelayMs = 150;

    for (let attempt = 0; attempt < maxAttempts; attempt += 1) {
      try {
        return await this.storage.downloadReport(
          report.reportKey,
          requesterRole,
          requesterClubId,
        );
      } catch (err) {
        // If the row was cleaned up after a failed upload, let caller retry creation.
        const stillExists = await this.reports.exists({
          where: { id: report.id },
        });
        if (!stillExists) return null;
        if (attempt < maxAttempts - 1) {
          // Allow a small window for the winning request to finish uploading.
          await this.sleep(baseDelayMs * (attempt + 1));
          continue;
        }
        throw err;
      }
    }

    return null;
  }

  private async buildAnnualReportPdf(
    clubId: string | null,
    ayStart: number,
    now: Date,
  ): Promise<Buffer> {
    // TODO(Zone 5): replace with real generator util
    const label = `${ayStart}-${ayStart + 1}`;
    const stamp = now.toISOString();
    const txt = `Annual Report\nScope: ${clubId ?? 'GLOBAL'}\nAcademic Year: ${label}\nGeneratedAt: ${stamp}\n`;
    return Buffer.from(`%PDF-1.4\n%${txt}\n%%EOF`, 'utf8');
  }

  private authorizeReportRequestStrict(params: {
    requesterRole: UserRole;
    requesterClubId: string | null;
    targetClubId: string | null;
  }) {
    const { requesterRole, requesterClubId, targetClubId } = params;

    if (requesterRole === UserRole.ADMIN) {
      if (targetClubId !== null) forbidden('Forbidden');
      return;
    }

    if (requesterRole === UserRole.CLUB) {
      if (!targetClubId) forbidden('Forbidden');
      if (!requesterClubId || requesterClubId !== targetClubId)
        forbidden('Forbidden');
      return;
    }

    forbidden('Forbidden');
  }

  private async findPersistedReport(
    clubId: string | null,
    ayStart: number,
  ): Promise<AnnualReport | null> {
    return this.reports.findOne({
      where: {
        ...(clubId === null ? { club: IsNull() } : { club: { id: clubId } }),
        year: ayStart,
      },
    });
  }

  private async requestAnnualReportInternal(
    requesterId: string,
    requesterRole: UserRole,
    targetClubId: string | null,
    yearInput: any,
  ): Promise<AnnualReportResult> {
    const now = new Date();
    const ayStart = this.normalizeRequestedAcademicYearStart(yearInput, now);

    const requesterClubId =
      requesterRole === UserRole.CLUB
        ? (await this.findClubByUserIdOrThrow(requesterId)).id
        : null;

    this.authorizeReportRequestStrict({
      requesterRole,
      requesterClubId,
      targetClubId,
    });
    await this.validateReportYearRangeOrThrow(targetClubId, ayStart);

    const persist = this.shouldPersistReport(ayStart, now);

    if (!persist) {
      const pdfBuffer = await this.buildAnnualReportPdf(
        targetClubId,
        ayStart,
        now,
      );
      return {
        clubId: targetClubId,
        year: ayStart,
        generatedAt: now.toISOString(),
        filename: this.reportFilename(targetClubId, ayStart),
        contentType: 'application/pdf',
        pdfBuffer,
      };
    }

    const existing = await this.findPersistedReport(targetClubId, ayStart);
    if (existing) {
      const pdfBuffer = await this.tryDownloadPersistedReport(
        existing,
        requesterRole,
        requesterClubId,
      );
      if (pdfBuffer) {
        return {
          clubId: targetClubId,
          year: ayStart,
          generatedAt: existing.generatedAt.toISOString(),
          filename: this.reportFilename(targetClubId, ayStart),
          contentType: 'application/pdf',
          pdfBuffer,
        };
      }
    }

    const freshPdf = await this.buildAnnualReportPdf(
      targetClubId,
      ayStart,
      now,
    );

    const reportKey = this.storage.buildReportKey(targetClubId, ayStart);

    const insertReportRow = async (): Promise<{
      report: AnnualReport;
      created: boolean;
    }> => {
      return this.runInTransaction(async (qr) => {
        const repo = qr.manager.getRepository(AnnualReport);

        const found = await repo.findOne({
          where: {
            ...(targetClubId === null
              ? { club: IsNull() }
              : { club: { id: targetClubId } }),
            year: ayStart,
          },
        });
        if (found) return { report: found, created: false };

        try {
          const created = await repo.save(
            repo.create({
              club: targetClubId ? ({ id: targetClubId } as any) : null,
              year: ayStart,
              generatedAt: now,
              reportKey,
            }),
          );
          return { report: created, created: true };
        } catch (err: any) {
          if (this.isPgUniqueViolation(err)) {
            const winner = await repo.findOne({
              where: {
                ...(targetClubId === null
                  ? { club: IsNull() }
                  : { club: { id: targetClubId } }),
                year: ayStart,
              },
            });
            if (winner) return { report: winner, created: false };
          }
          throw err;
        }
      });
    };

    // Phase 2: insert metadata only, no storage I/O inside the transaction.
    let tx = await insertReportRow();

    if (!tx.created) {
      const pdfBuffer = await this.tryDownloadPersistedReport(
        tx.report,
        requesterRole,
        requesterClubId,
      );
      if (pdfBuffer) {
        return {
          clubId: targetClubId,
          year: ayStart,
          generatedAt: tx.report.generatedAt.toISOString(),
          filename: this.reportFilename(targetClubId, ayStart),
          contentType: 'application/pdf',
          pdfBuffer,
        };
      }

      // If the winning row disappeared (upload cleanup), try once more to insert.
      tx = await insertReportRow();
      if (!tx.created) {
        const retryBuffer = await this.tryDownloadPersistedReport(
          tx.report,
          requesterRole,
          requesterClubId,
        );
        if (retryBuffer) {
          return {
            clubId: targetClubId,
            year: ayStart,
            generatedAt: tx.report.generatedAt.toISOString(),
            filename: this.reportFilename(targetClubId, ayStart),
            contentType: 'application/pdf',
            pdfBuffer: retryBuffer,
          };
        }
      }
    }

    if (!tx.created) {
      internal('Failed to obtain a persisted annual report');
    }

    // Phase 3: upload outside TX. If it fails, delete the row to avoid broken references.
    try {
      await this.storage.saveAnnualReportByKey(
        reportKey,
        freshPdf,
        requesterRole,
        true,
      );
    } catch (err) {
      try {
        await this.reports.delete({ id: tx.report.id });
      } catch (cleanupErr) {
        this.logger.error(
          `Failed to clean up annual report row ${tx.report.id} after upload error`,
          cleanupErr instanceof Error ? cleanupErr.stack : String(cleanupErr),
        );
      }
      throw err;
    }

    return {
      clubId: targetClubId,
      year: ayStart,
      generatedAt: tx.report.generatedAt.toISOString(),
      filename: this.reportFilename(targetClubId, ayStart),
      contentType: 'application/pdf',
      pdfBuffer: freshPdf,
    };
  }

  // ───────────────────────────────────────────────
  // 10) GET /clubs/:id/reports/:year
  // ───────────────────────────────────────────────

  async getAnnualReport(
    requesterId: string,
    requesterRole: UserRole,
    clubId: string | null,
    year: any,
  ): Promise<AnnualReportResult> {
    this.logger.log(
      `[Reports] GET by ${requesterId} role=${requesterRole} scope=${clubId ?? 'GLOBAL'} year=${year ?? 'CURRENT'}`,
    );

    try {
      return await this.requestAnnualReportInternal(
        requesterId,
        requesterRole,
        clubId,
        year,
      );
    } catch (err: any) {
      this.logger.error(
        `[Reports] Failed role=${requesterRole} scope=${clubId ?? 'GLOBAL'} year=${year ?? 'CURRENT'}: ${err?.message ?? err}`,
        err?.stack,
      );
      throw err;
    }
  }
}
