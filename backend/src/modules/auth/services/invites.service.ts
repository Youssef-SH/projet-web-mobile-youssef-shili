import { Injectable, Logger } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { DataSource, In, QueryRunner, Repository } from 'typeorm';
import * as crypto from 'crypto';
import * as bcrypt from 'bcrypt';
import { isEmail as isEmailFn } from 'class-validator';

import { sha256Hex } from '../../../common/utils/crypto.util';
import { normalizeEmail } from '../../../common/utils/strings.util';
import {
  conflict,
  forbidden,
  invalidToken,
  notFound,
  validationError,
} from '../../../common/utils/fail.util';

import { User } from '../entities/user.entity';
import { Session } from '../entities/session.entity';
import { UserInvite } from '../entities/user-invite.entity';

import { InviteType } from '../entities/enums/invite-type.enum';
import { InviteStatus } from '../entities/enums/invite-status.enum';
import { UserRole } from '../../../common/enums/user-role.enum';

import { SessionsService } from './sessions.service';
import { TokensService } from './tokens.service';

import { Club } from '../../clubs/entities/club.entity';
import { ClubLeader } from '../../clubs/entities/club-leader.entity';
import { StorageService } from 'src/modules/storage/storage.service';

import { ClubRole } from 'src/common/enums/club-role.enum';
import { StudyLevel } from 'src/common/enums/study-level.enum';
import { DEFAULT_CLUB_LOGO_URL } from 'src/common/constants/club.constants';
import { validateClubLeadersInvariant } from 'src/common/validators/club-leaders.validator';

type Mode = 'add' | 'replace';

type PgDriverErrorLike = {
  code?: unknown;
  constraint?: unknown;
};

type TypeOrmErrorLike = {
  code?: unknown;
  constraint?: unknown;
  driverError?: PgDriverErrorLike;
};

function envInt(name: string, fallback: number, min = 1, max = 100000): number {
  const raw = process.env[name];
  if (raw === undefined || raw === '') return fallback;
  const n = Number(raw);
  if (!Number.isFinite(n) || !Number.isInteger(n)) return fallback;
  return Math.min(max, Math.max(min, n));
}

const INVITE_TTL_SECONDS = 7 * 24 * 3600;
const CSV_MAX_ROWS = envInt('INVITE_CSV_MAX_ROWS', 5000, 1, 200000);
const IN_BATCH_SIZE = envInt('INVITE_IN_BATCH_SIZE', 1000, 1, 10000);

@Injectable()
export class InvitesService {
  private readonly logger = new Logger(InvitesService.name);

  constructor(
    @InjectRepository(User) private readonly users: Repository<User>,
    @InjectRepository(UserInvite)
    private readonly invites: Repository<UserInvite>,
    private readonly sessions: SessionsService,
    private readonly tokens: TokensService,
    private readonly storage: StorageService,
    private readonly dataSource: DataSource,
  ) {}

  private async runInTransaction<T>(
    fn: (qr: QueryRunner) => Promise<T>,
  ): Promise<T> {
    const qr = this.dataSource.createQueryRunner();
    await qr.connect();
    await qr.startTransaction();
    try {
      const result = await fn(qr);
      await qr.commitTransaction();
      return result;
    } catch (err) {
      await qr.rollbackTransaction();
      throw err;
    } finally {
      await qr.release();
    }
  }

  private secondsFromNow(seconds: number): Date {
    return new Date(Date.now() + seconds * 1000);
  }

  private newInviteToken(): { raw: string; hash: string } {
    const raw = crypto.randomBytes(32).toString('hex');
    const hash = sha256Hex(raw);
    return { raw, hash };
  }

  private isValidEmail(email: string): boolean {
    return isEmailFn(email);
  }

  private roleForAccountType(type: InviteType): UserRole {
    return type === InviteType.STUDENT ? UserRole.STUDENT : UserRole.CLUB;
  }

  private getPgCode(err: unknown): string | null {
    if (!err || typeof err !== 'object') return null;
    const e = err as TypeOrmErrorLike;
    const code = e.code ?? e.driverError?.code;
    return typeof code === 'string' ? code : null;
  }

  private getPgConstraint(err: unknown): string | null {
    if (!err || typeof err !== 'object') return null;
    const e = err as TypeOrmErrorLike;
    const c = e.constraint ?? e.driverError?.constraint;
    return typeof c === 'string' ? c : null;
  }

  private isPgUniqueViolation(
    err: unknown,
    constraintIncludes?: string,
  ): boolean {
    if (this.getPgCode(err) !== '23505') return false;
    if (!constraintIncludes) return true;
    const constraint = (this.getPgConstraint(err) ?? '').toLowerCase();
    return constraint.includes(constraintIncludes.toLowerCase());
  }

  private isTokenHashUniqueViolation(err: unknown): boolean {
    return this.isPgUniqueViolation(err, 'token_hash');
  }

  private async saveInviteWithRetryOn(
    saveFn: (invite: UserInvite) => Promise<UserInvite>,
    build: () => UserInvite,
    tries = 3,
  ): Promise<UserInvite> {
    let lastErr: unknown;
    for (let i = 0; i < tries; i++) {
      try {
        return await saveFn(build());
      } catch (err) {
        lastErr = err;
        if (!this.isTokenHashUniqueViolation(err)) throw err;
      }
    }
    throw lastErr;
  }

  private async saveInviteWithRetry(
    build: () => UserInvite,
    tries = 3,
  ): Promise<UserInvite> {
    return this.saveInviteWithRetryOn(
      (inv) => this.invites.save(inv),
      build,
      tries,
    );
  }

  private async forEachConcurrent<T>(
    items: T[],
    limit: number,
    fn: (item: T) => Promise<void>,
  ): Promise<void> {
    const executing = new Set<Promise<void>>();

    for (const item of items) {
      const p = Promise.resolve().then(() => fn(item));
      executing.add(p);
      void p.finally(() => executing.delete(p));
      if (executing.size >= limit) {
        await Promise.race(executing);
      }
    }

    await Promise.all(executing);
  }

  private async devLogIfTokenKnown(
    manager: QueryRunner['manager'],
    tokenHash: string,
  ) {
    if (process.env.NODE_ENV === 'production') return;

    const anyInvite = await manager.findOne(UserInvite, {
      where: { tokenHash } as { tokenHash: string },
    });

    if (anyInvite) {
      this.logger.debug(
        `[DEV] Token rejected but exists in DB: status=${anyInvite.status}, expiresAt=${anyInvite.expiresAt?.toISOString?.()}`,
      );
    } else {
      this.logger.debug(`[DEV] Token rejected and not found in DB`);
    }
  }

  private async getPendingInviteOrThrow(
    qr: QueryRunner,
    tokenHash: string,
    expectedType: InviteType,
  ): Promise<UserInvite> {
    const invite = await qr.manager
      .createQueryBuilder(UserInvite, 'i')
      .setLock('pessimistic_write')
      .where('i.tokenHash = :hash', { hash: tokenHash })
      .andWhere('i.status = :status', { status: InviteStatus.PENDING })
      .andWhere('i.expiresAt > :now', { now: new Date() })
      .getOne();

    if (!invite) {
      await this.devLogIfTokenKnown(qr.manager, tokenHash);
      return invalidToken();
    }

    if (invite.type !== expectedType) return forbidden();
    return invite;
  }

  private async issueSessionTokens(
    user: User,
    userAgent?: string | null,
    ipAddress?: string | null,
  ) {
    const rememberMe = false;
    const refreshSeconds = this.tokens.getRefreshTtlSeconds(rememberMe);
    const expiresAt = this.sessions.computeExpiresAt(refreshSeconds);

    const temp = crypto.randomBytes(32).toString('hex');
    const session = await this.sessions.create(
      user,
      sha256Hex(temp),
      expiresAt,
      rememberMe,
      userAgent ?? null,
      ipAddress ?? null,
    );

    const accessToken = this.tokens.signAccessToken(user, session.id);
    const refreshToken = this.tokens.signRefreshToken(
      user,
      session.id,
      rememberMe,
    );

    await this.sessions.rotateById(
      session.id,
      sha256Hex(refreshToken),
      expiresAt,
      userAgent ?? null,
      ipAddress ?? null,
    );

    return { accessToken, refreshToken };
  }

  private async upsertClubForUser(
    qr: QueryRunner,
    user: User,
    clubName: string,
    clubDescription: string,
  ): Promise<{ club: Club; previousLogoUrl: string | null }> {
    let previousLogoUrl: string | null = null;

    let clubEntity = await qr.manager
      .getRepository(Club)
      .createQueryBuilder('c')
      .setLock('pessimistic_write')
      .where('c.userId = :uid', { uid: user.id })
      .getOne();

    if (!clubEntity) {
      clubEntity = await qr.manager.save(
        qr.manager.create(Club, {
          user,
          userId: user.id,
          name: clubName,
          description: clubDescription,
          logoUrl: DEFAULT_CLUB_LOGO_URL,
        }),
      );
    } else {
      previousLogoUrl = clubEntity.logoUrl ?? null;
      clubEntity.name = clubName;
      clubEntity.description = clubDescription;
      clubEntity = await qr.manager.save(clubEntity);
    }

    return { club: clubEntity, previousLogoUrl };
  }

  private async replaceClubLeaders(
    qr: QueryRunner,
    clubId: string,
    leaders: Array<{
      role: ClubRole;
      fullName: string;
      email: string;
      phone: string;
      cin: string;
      studyLevel: StudyLevel;
      specialization: string;
    }>,
  ) {
    await qr.manager.delete(ClubLeader, { club: { id: clubId } });

    for (const l of leaders) {
      await qr.manager.save(
        qr.manager.create(ClubLeader, {
          club: { id: clubId },
          role: l.role,
          fullName: (l.fullName ?? '').trim(),
          cin: (l.cin ?? '').trim(),
          phone: (l.phone ?? '').trim(),
          email: normalizeEmail(l.email),
          studyLevel: l.studyLevel,
          specialization: (l.specialization ?? '').trim(),
        }),
      );
    }
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

  private chunk<T>(arr: T[], size: number): T[][] {
    if (!arr.length) return [];
    const out: T[][] = [];
    for (let i = 0; i < arr.length; i += size) out.push(arr.slice(i, i + size));
    return out;
  }

  private async findUsersByEmailLower(
    targets: string[],
    selectOnlyEmail = true,
  ): Promise<User[]> {
    if (!targets.length) return [];
    const out: User[] = [];

    for (const batch of this.chunk(targets, IN_BATCH_SIZE)) {
      const qb = this.users
        .createQueryBuilder('u')
        .where('lower(u.email) IN (:...targets)', { targets: batch });

      if (selectOnlyEmail) qb.select(['u.email']);
      out.push(...(await qb.getMany()));
    }

    return out;
  }

  private async findPendingInvitesByEmailLower(
    targets: string[],
    selectOnlyEmail: boolean,
  ): Promise<UserInvite[]> {
    if (!targets.length) return [];
    const out: UserInvite[] = [];

    for (const batch of this.chunk(targets, IN_BATCH_SIZE)) {
      const qb = this.invites
        .createQueryBuilder('i')
        .where('i.status = :status', { status: InviteStatus.PENDING })
        .andWhere('lower(i.email) IN (:...targets)', { targets: batch });

      if (selectOnlyEmail) qb.select(['i.email']);
      out.push(...(await qb.getMany()));
    }

    return out;
  }

  private parseCsvEmails(csvText: string) {
    const lines = (csvText ?? '')
      .replace(/\r\n/g, '\n')
      .replace(/\r/g, '\n')
      .split('\n')
      .map((l) => l.trim())
      .filter(Boolean);

    if (!lines.length) {
      validationError('Empty CSV', { csv: ['Empty CSV'] });
    }

    const header = (lines[0] || '')
      .replace(/^\uFEFF/, '')
      .trim()
      .toLowerCase();

    if (header !== 'email') {
      validationError('CSV must have a single header "email"', {
        csv: ['Header must be "email"'],
      });
    }

    const dataRows = Math.max(0, lines.length - 1);
    if (dataRows > CSV_MAX_ROWS) {
      validationError(`CSV too large (max ${CSV_MAX_ROWS} rows)`, {
        rows: dataRows,
      });
    }

    if (lines.length === 1) return { emails: [], invalidRows: [] };

    const invalidRows: { row: number; email: string; reason: string }[] = [];
    const emailsRaw: string[] = [];

    for (let i = 1; i < lines.length; i++) {
      const raw = lines[i];
      const email = normalizeEmail(raw);

      if (!this.isValidEmail(email)) {
        invalidRows.push({ row: i + 1, email: raw, reason: 'Invalid email' });
        continue;
      }

      emailsRaw.push(email);
    }

    const seen = new Set<string>();
    const emails = emailsRaw.filter((e) =>
      seen.has(e) ? false : (seen.add(e), true),
    );

    return { emails, invalidRows };
  }

  async preview(accountType: InviteType, mode: Mode, csvText: string) {
    const { emails, invalidRows } = this.parseCsvEmails(csvText);
    const role = this.roleForAccountType(accountType);
    const targets = emails;

    const [users, pendingInvites, activeRoleUsers] = await Promise.all([
      this.findUsersByEmailLower(targets, true),
      this.findPendingInvitesByEmailLower(targets, true),
      this.users.find({
        where: { role, isActive: true },
        select: { email: true, isActive: true },
      }),
    ]);

    const userSet = new Set(users.map((u) => normalizeEmail(u.email)));
    const pendingSet = new Set(
      pendingInvites.map((i) => normalizeEmail(i.email)),
    );

    let willInviteNew = 0;
    let willReissuePendingInvite = 0;
    let willSkipExisting = 0;

    for (const e of emails) {
      if (userSet.has(e)) {
        willSkipExisting++;
        continue;
      }
      if (pendingSet.has(e)) {
        willReissuePendingInvite++;
        continue;
      }
      willInviteNew++;
    }

    let willDeactivate = 0;
    if (mode === 'replace') {
      const csvSet = new Set(emails);
      for (const u of activeRoleUsers) {
        if (u.isActive && !csvSet.has(normalizeEmail(u.email)))
          willDeactivate++;
      }
    }

    return {
      summary: {
        accountType,
        mode,
        totalRows: emails.length,
        willInviteNew,
        willReissuePendingInvite,
        willSkipExisting,
        willDeactivate,
      },
      invalidRows,
    };
  }

  async bulk(
    accountType: InviteType,
    mode: Mode,
    csvText: string,
    confirm?: string,
  ) {
    if (mode === 'replace' && confirm !== 'CONFIRM') {
      forbidden('Destructive operation requires confirm="CONFIRM"', {
        confirm: ['CONFIRM is required for replace mode'],
      });
    }

    const { emails, invalidRows } = this.parseCsvEmails(csvText);

    if (invalidRows.length) {
      validationError('Invalid CSV rows', { rows: invalidRows });
    }

    const role = this.roleForAccountType(accountType);

    const roleUsers = await this.users.find({
      where: { role },
      select: { id: true, email: true, isActive: true },
    });

    let invited = 0;
    let reissued = 0;
    let skipped = 0;
    let deactivated = 0;

    if (mode === 'replace') {
      const csvSet = new Set(emails);
      const toDeactivate = roleUsers
        .filter((u) => u.isActive && !csvSet.has(normalizeEmail(u.email)))
        .map((u) => u.id);

      if (toDeactivate.length) {
        await this.users.update({ id: In(toDeactivate) }, { isActive: false });
        await this.sessions.revokeAllForUsers(toDeactivate);
        deactivated = toDeactivate.length;
      }
    }

    if (!emails.length) {
      return { accountType, mode, invited, reissued, skipped, deactivated };
    }

    const targets = emails;

    const [existingUsersForTargets, pendingInvitesForTargets] =
      await Promise.all([
        this.findUsersByEmailLower(targets, true),
        this.findPendingInvitesByEmailLower(targets, false),
      ]);

    const userSet = new Set(
      existingUsersForTargets.map((u) => normalizeEmail(u.email)),
    );

    const pendingByEmail = new Map<string, UserInvite>(
      pendingInvitesForTargets.map((i) => [normalizeEmail(i.email), i]),
    );

    const CONCURRENCY = envInt('INVITE_BULK_CONCURRENCY', 15, 1, 200);

    await this.forEachConcurrent(targets, CONCURRENCY, async (email) => {
      if (userSet.has(email)) {
        skipped++;
        return;
      }

      const pending = pendingByEmail.get(email);
      if (pending) {
        await this.saveInviteWithRetry(() => {
          const token = this.newInviteToken();
          pending.type = accountType;
          pending.tokenHash = token.hash;
          pending.expiresAt = this.secondsFromNow(INVITE_TTL_SECONDS);
          pending.status = InviteStatus.PENDING;
          return pending;
        });
        reissued++;
        return;
      }

      try {
        await this.saveInviteWithRetry(() => {
          const token = this.newInviteToken();
          return this.invites.create({
            email,
            type: accountType,
            tokenHash: token.hash,
            status: InviteStatus.PENDING,
            expiresAt: this.secondsFromNow(INVITE_TTL_SECONDS),
          });
        });
        invited++;
      } catch (err) {
        if (
          !this.isPgUniqueViolation(err) ||
          this.isTokenHashUniqueViolation(err)
        )
          throw err;

        const nowPending = await this.invites
          .createQueryBuilder('i')
          .where('lower(i.email) = :email', { email })
          .andWhere('i.status = :status', { status: InviteStatus.PENDING })
          .getOne();

        if (!nowPending) throw err;

        pendingByEmail.set(email, nowPending);

        await this.saveInviteWithRetry(() => {
          const token = this.newInviteToken();
          nowPending.type = accountType;
          nowPending.tokenHash = token.hash;
          nowPending.expiresAt = this.secondsFromNow(INVITE_TTL_SECONDS);
          nowPending.status = InviteStatus.PENDING;
          return nowPending;
        });

        reissued++;
      }
    });

    return { accountType, mode, invited, reissued, skipped, deactivated };
  }

  async reactivate(
    userId: string,
    newEmail?: string | null,
  ): Promise<{
    userId: string;
    email: string;
    accountType: InviteType;
    expiresAt: Date;
  }> {
    return this.runInTransaction(async (qr) => {
      const user = await qr.manager
        .createQueryBuilder(User, 'u')
        .setLock('pessimistic_write')
        .where('u.id = :id', { id: userId })
        .getOne();

      if (!user) return notFound();
      if (user.isActive) return conflict();

      let accountType: InviteType;
      if (user.role === UserRole.STUDENT) accountType = InviteType.STUDENT;
      else if (user.role === UserRole.CLUB) accountType = InviteType.CLUB;
      else return conflict();

      const oldEmail = normalizeEmail(user.email);
      let targetEmail = oldEmail;

      if (newEmail) {
        const normalized = normalizeEmail(newEmail);

        const exists = await qr.manager
          .createQueryBuilder(User, 'u')
          .select(['u.id'])
          .where('lower(u.email) = :email', { email: normalized })
          .getOne();

        if (exists && exists.id !== user.id) return conflict();
        targetEmail = normalized;
      }

      if (oldEmail !== targetEmail) {
        await qr.manager
          .createQueryBuilder()
          .delete()
          .from(UserInvite)
          .where('status = :status', { status: InviteStatus.PENDING })
          .andWhere('lower(email) = :email', { email: oldEmail })
          .execute();
      }

      user.email = targetEmail;
      await qr.manager.save(user);

      await qr.manager.getRepository(Session).delete({ user: { id: user.id } });

      const expiresAt = this.secondsFromNow(INVITE_TTL_SECONDS);

      const pending = await qr.manager
        .createQueryBuilder(UserInvite, 'i')
        .setLock('pessimistic_write')
        .where('lower(i.email) = :email', { email: targetEmail })
        .andWhere('i.status = :status', { status: InviteStatus.PENDING })
        .getOne();

      if (pending) {
        await this.saveInviteWithRetryOn(
          (inv) => qr.manager.save(UserInvite, inv),
          () => {
            const token = this.newInviteToken();
            pending.type = accountType;
            pending.tokenHash = token.hash;
            pending.expiresAt = expiresAt;
            pending.status = InviteStatus.PENDING;
            return pending;
          },
        );
      } else {
        await this.saveInviteWithRetryOn(
          (inv) => qr.manager.save(UserInvite, inv),
          () => {
            const token = this.newInviteToken();
            return qr.manager.create(UserInvite, {
              email: targetEmail,
              type: accountType,
              tokenHash: token.hash,
              status: InviteStatus.PENDING,
              expiresAt,
            });
          },
        );
      }

      return { userId: user.id, email: targetEmail, accountType, expiresAt };
    }).catch((err: unknown) => {
      if (this.isPgUniqueViolation(err)) conflict();
      throw err;
    });
  }

  async resend(emails: string[]) {
    if (!Array.isArray(emails) || emails.length === 0) {
      validationError('emails array is required', {
        emails: ['emails array is required'],
      });
    }

    const targets = emails.map(normalizeEmail);

    const pendingInvites = await this.invites.find({
      where: {
        email: In(targets),
        status: InviteStatus.PENDING,
      },
    });

    let resent = 0;
    let skipped = 0;
    let failed = 0;

    const byEmail = new Map(
      pendingInvites.map((i) => [normalizeEmail(i.email), i]),
    );

    for (const email of targets) {
      const invite = byEmail.get(email);

      if (!invite) {
        skipped++;
        continue;
      }

      try {
        await this.saveInviteWithRetry(() => {
          const token = this.newInviteToken();
          invite.tokenHash = token.hash;
          invite.expiresAt = this.secondsFromNow(INVITE_TTL_SECONDS);
          invite.status = InviteStatus.PENDING;
          return invite;
        });
        resent++;
      } catch (err) {
        failed++;
        this.logger.warn(`[ResendInvite] Failed to resend invite for ${email}`);
      }
    }

    return { requested: targets.length, resent, skipped, failed };
  }

  async acceptStudent(input: {
    token: string;
    password: string;
    fullName: string;
    userAgent?: string | null;
    ipAddress?: string | null;
  }) {
    const { token, password, userAgent, ipAddress } = input;

    const tokenHash = sha256Hex(token);
    let user!: User;

    await this.runInTransaction(async (qr) => {
      const invite = await this.getPendingInviteOrThrow(
        qr,
        tokenHash,
        InviteType.STUDENT,
      );

      const email = normalizeEmail(invite.email);
      const fullName = (input.fullName ?? '').trim();

      const existing = await qr.manager
        .createQueryBuilder(User, 'u')
        .setLock('pessimistic_write')
        .where('lower(u.email) = :email', { email })
        .getOne();

      const passwordHash = await bcrypt.hash(password, 12);

      if (existing) {
        if (existing.isActive) conflict();
        if (existing.role !== UserRole.STUDENT) conflict();

        existing.passwordHash = passwordHash;
        existing.isActive = true;
        existing.fullName = fullName;

        user = await qr.manager.save(existing);
      } else {
        user = await qr.manager.save(
          qr.manager.create(User, {
            email,
            passwordHash,
            isActive: true,
            role: UserRole.STUDENT,
            fullName,
          }),
        );
      }

      await qr.manager.getRepository(Session).delete({ user: { id: user.id } });

      invite.status = InviteStatus.ACCEPTED;
      await qr.manager.save(invite);
    }).catch((err: unknown) => {
      if (this.isPgUniqueViolation(err)) conflict();
      throw err;
    });

    const { accessToken, refreshToken } = await this.issueSessionTokens(
      user,
      userAgent,
      ipAddress,
    );

    return {
      accessToken,
      refreshToken,
      user: {
        id: user.id,
        email: user.email,
        role: user.role,
        fullName: user.fullName ?? null,
      },
    };
  }

  async acceptClub(input: {
    token: string;
    password: string;
    userAgent?: string | null;
    ipAddress?: string | null;
    club: {
      name: string;
      description?: string;
      logo?: Express.Multer.File | null;
    };
    leaders: Array<{
      role: ClubRole;
      fullName: string;
      email: string;
      phone: string;
      cin: string;
      studyLevel: StudyLevel;
      specialization: string;
    }>;
  }) {
    const { token, password, club, leaders, userAgent, ipAddress } = input;

    validateClubLeadersInvariant(leaders);

    const clubName = (club?.name ?? '').trim();
    const clubDescription = (club?.description ?? '').trim();

    if (!clubName) {
      validationError('Club name is required', {
        name: ['Club name is required'],
      });
    }

    if (!clubDescription) {
      validationError('Club description is required', {
        description: ['Club description is required'],
      });
    }

    const tokenHash = sha256Hex(token);

    let user!: User;
    let clubId!: string;
    let previousLogoUrl: string | null = null;

    await this.runInTransaction(async (qr) => {
      const invite = await this.getPendingInviteOrThrow(
        qr,
        tokenHash,
        InviteType.CLUB,
      );

      const email = normalizeEmail(invite.email);

      const existingUser = await qr.manager
        .createQueryBuilder(User, 'u')
        .setLock('pessimistic_write')
        .where('lower(u.email) = :email', { email })
        .getOne();

      const passwordHash = await bcrypt.hash(password, 12);

      if (existingUser) {
        if (existingUser.isActive || existingUser.role !== UserRole.CLUB) {
          conflict();
        }

        existingUser.passwordHash = passwordHash;
        existingUser.isActive = true;
        existingUser.fullName = null;
        user = await qr.manager.save(existingUser);
      } else {
        user = await qr.manager.save(
          qr.manager.create(User, {
            email,
            passwordHash,
            isActive: true,
            role: UserRole.CLUB,
            fullName: null,
          }),
        );
      }

      await qr.manager.getRepository(Session).delete({ user: { id: user.id } });

      const { club: clubEntity, previousLogoUrl: prev } =
        await this.upsertClubForUser(qr, user, clubName, clubDescription);

      previousLogoUrl = prev;
      clubId = clubEntity.id;

      await this.replaceClubLeaders(qr, clubId, leaders);

      invite.status = InviteStatus.ACCEPTED;
      await qr.manager.save(invite);
    }).catch((err: unknown) => {
      if (this.isPgUniqueViolation(err)) conflict();
      throw err;
    });

    let newLogoUrl: string | null = null;
    let newLogoKey: string | null = null;

    if (club?.logo) {
      try {
        const uploaded = await this.storage.uploadClubLogo(
          clubId,
          club.logo,
          UserRole.CLUB,
        );

        newLogoKey = uploaded.key;
        newLogoUrl = uploaded.publicUrl;

        const res = await this.dataSource
          .createQueryBuilder()
          .update(Club)
          .set({ logoUrl: newLogoUrl })
          .where('id = :id', { id: clubId })
          .execute();

        if (!res.affected && newLogoKey) {
          await this.storage
            .deleteRawObject([newLogoKey])
            .catch(() => undefined);
          newLogoUrl = null;
          newLogoKey = null;
        }
      } catch (e: unknown) {
        if (newLogoKey) {
          await this.storage
            .deleteRawObject([newLogoKey])
            .catch(() => undefined);
        }

        const msg = e instanceof Error ? e.message : String(e);
        const stack = e instanceof Error ? e.stack : undefined;

        this.logger.error(
          `[AcceptClub] Logo upload/update failed (non-fatal): ${msg}`,
          stack,
        );
      }

      if (
        newLogoKey &&
        previousLogoUrl &&
        previousLogoUrl !== DEFAULT_CLUB_LOGO_URL
      ) {
        const oldKey = this.extractSupabasePublicKey(previousLogoUrl);
        if (oldKey && oldKey !== newLogoKey) {
          await this.storage.deleteRawObject([oldKey]).catch(() => undefined);
        }
      }
    }

    const { accessToken, refreshToken } = await this.issueSessionTokens(
      user,
      userAgent,
      ipAddress,
    );

    return {
      accessToken,
      refreshToken,
      user: {
        id: user.id,
        email: user.email,
        role: user.role,
        fullName: null,
        clubId,
        logoUrl: newLogoUrl ?? DEFAULT_CLUB_LOGO_URL,
      },
    };
  }
}
