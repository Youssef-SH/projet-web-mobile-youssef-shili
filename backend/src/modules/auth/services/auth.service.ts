import { Injectable, Logger, HttpStatus } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository, MoreThan } from 'typeorm';
import * as bcrypt from 'bcrypt';
import * as crypto from 'crypto';

import { ERROR } from '../../../common/constants/error-codes';
import { sha256Hex } from '../../../common/utils/crypto.util';
import { normalizeEmail } from '../../../common/utils/strings.util';
import { fail } from '../../../common/utils/fail.util';

import { User } from '../entities/user.entity';
import { PasswordResetToken } from '../entities/password-reset-token.entity';

import { TokensService, RefreshTokenPayload } from './tokens.service';
import { SessionsService } from './sessions.service';

import { UserRole } from 'src/common/enums/user-role.enum';
import { Club } from 'src/modules/clubs/entities/club.entity';

type JwtUser = {
  id: string;
  role: UserRole;
  sid: string;
  isActive?: boolean;
};

@Injectable()
export class AuthService {
  private readonly logger = new Logger(AuthService.name);

  constructor(
    @InjectRepository(User) private readonly users: Repository<User>,
    @InjectRepository(PasswordResetToken)
    private readonly resetRepo: Repository<PasswordResetToken>,
    private readonly tokens: TokensService,
    private readonly sessions: SessionsService,
  ) {}

  private hashToken(token: string): string {
    return sha256Hex(token);
  }

  private async findClubId(userId: string): Promise<string | null> {
    const club = await this.users
      .createQueryBuilder('u')
      .leftJoin(Club, 'c', 'c.user_id = u.id')
      .select('c.id', 'id')
      .where('u.id = :id', { id: userId })
      .getRawOne<{ id: string }>();

    return club?.id ?? null;
  }

  // ───────────────────────────────────────────────
  // POST /auth/login
  // ───────────────────────────────────────────────
  async login(
    input: { email: string; password: string; rememberMe?: boolean },
    userAgent?: string,
    ipAddress?: string,
  ): Promise<{
    accessToken: string;
    refreshToken: string;
    user: {
      id: string;
      email: string;
      role: UserRole;
      fullName: string | null;
      clubId: string | null;
    };
  }> {
    const email = normalizeEmail(input.email);

    const user = await this.users
      .createQueryBuilder('u')
      .addSelect('u.passwordHash')
      .where('lower(u.email) = :email', { email })
      .getOne();

    if (!user) {
      fail(
        HttpStatus.UNAUTHORIZED,
        ERROR.INVALID_CREDENTIALS,
        'Invalid credentials',
      );
    }
    if (!user.isActive) {
      fail(HttpStatus.FORBIDDEN, ERROR.ACCOUNT_INACTIVE, 'Account inactive');
    }

    const ok = await bcrypt.compare(input.password, user.passwordHash ?? '');
    if (!ok) {
      fail(
        HttpStatus.UNAUTHORIZED,
        ERROR.INVALID_CREDENTIALS,
        'Invalid credentials',
      );
    }

    let clubId: string | null = null;

    if (user.role === UserRole.CLUB) {
      clubId = await this.findClubId(user.id);
    }

    const rememberMe = !!input.rememberMe;

    const refreshSeconds = this.tokens.getRefreshTtlSeconds(rememberMe);
    const expiresAt = this.sessions.computeExpiresAt(refreshSeconds);

    const tempRaw = crypto.randomBytes(32).toString('hex');
    const session = await this.sessions.create(
      user,
      this.hashToken(tempRaw),
      expiresAt,
      rememberMe,
      userAgent,
      ipAddress,
    );

    const accessToken = this.tokens.signAccessToken(user, session.id);
    const refreshToken = this.tokens.signRefreshToken(
      user,
      session.id,
      rememberMe,
    );

    await this.sessions.rotateById(
      session.id,
      this.hashToken(refreshToken),
      expiresAt,
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
        fullName: user.role === UserRole.CLUB ? null : (user.fullName ?? null),
        clubId,
      },
    };
  }

  // ───────────────────────────────────────────────
  // POST /auth/refresh
  // ───────────────────────────────────────────────
  async refresh(
    refreshToken: string,
    userAgent?: string,
    ipAddress?: string,
  ): Promise<{ accessToken: string; refreshToken: string }> {
    // purge old sessions before verifying
    if (Math.random() < 0.01) {
      await this.sessions.purgeExpired();
    }

    const payload: RefreshTokenPayload =
      this.tokens.verifyRefreshToken(refreshToken);

    const session = await this.sessions.findById(payload.sid);
    if (!session) {
      fail(HttpStatus.UNAUTHORIZED, ERROR.INVALID_TOKEN, 'Invalid token');
    }

    const incomingHash = this.hashToken(refreshToken);
    if (session.refreshTokenHash !== incomingHash) {
      fail(HttpStatus.UNAUTHORIZED, ERROR.INVALID_TOKEN, 'Invalid token');
    }

    if (session.expiresAt <= new Date()) {
      await this.sessions.revokeById(session.id);
      fail(HttpStatus.UNAUTHORIZED, ERROR.INVALID_TOKEN, 'Invalid token');
    }

    const user = session.user;
    if (!user || !user.isActive) {
      fail(HttpStatus.FORBIDDEN, ERROR.ACCOUNT_INACTIVE, 'Account inactive');
    }

    const refreshSeconds = this.tokens.getRefreshTtlSeconds(session.rememberMe);
    const newExpiresAt = this.sessions.computeExpiresAt(refreshSeconds);

    const newAccess = this.tokens.signAccessToken(user, session.id);
    const newRefresh = this.tokens.signRefreshToken(
      user,
      session.id,
      session.rememberMe,
    );

    await this.sessions.rotateById(
      session.id,
      this.hashToken(newRefresh),
      newExpiresAt,
      userAgent,
      ipAddress,
    );

    return { accessToken: newAccess, refreshToken: newRefresh };
  }

  // ───────────────────────────────────────────────
  // POST /auth/logout
  // ───────────────────────────────────────────────
  async logout(currentUser: Pick<JwtUser, 'sid'>): Promise<void> {
    await this.sessions.revokeById(currentUser.sid);
  }

  // ───────────────────────────────────────────────
  // GET /auth/me
  // ───────────────────────────────────────────────
  async me(userId: string): Promise<{
    id: string;
    email: string;
    role: UserRole;
    fullName: string | null;
    clubId: string | null;
  }> {
    const user = await this.users.findOne({ where: { id: userId } });
    if (!user) {
      fail(HttpStatus.UNAUTHORIZED, ERROR.UNAUTHORIZED, 'Unauthorized');
    }

    let clubId: string | null = null;

    if (user.role === UserRole.CLUB) {
      clubId = await this.findClubId(user.id);
    }

    return {
      id: user.id,
      email: user.email,
      role: user.role,
      fullName: user.role === UserRole.CLUB ? null : (user.fullName ?? null),
      clubId,
    };
  }

  // ───────────────────────────────────────────────
  // POST /auth/password/forgot (always 202)
  // ───────────────────────────────────────────────
  async forgotPassword(email: string): Promise<void> {
    const normalizedEmail = normalizeEmail(email);
    const user = await this.users
      .createQueryBuilder('u')
      .where('lower(u.email) = :email', { email: normalizedEmail })
      .getOne();

    // Skip inactive accounts to avoid unnecessary tokens
    if (!user || !user.isActive) return; // always 202 behaviour

    // clean up existing unused tokens
    await this.resetRepo.delete({ user: { id: user.id }, used: false } as any);

    const raw = crypto.randomBytes(32).toString('hex');
    const hash = sha256Hex(raw);
    const expiresAt = this.sessions.computeExpiresAt(60 * 60); // 1 hour

    const rec = this.resetRepo.create({
      user,
      tokenHash: hash,
      expiresAt,
      used: false,
    });
    await this.resetRepo.save(rec);

    this.logger.warn(`Password reset requested for ${normalizedEmail}`);

    // TODO: Zone 6 — enqueue email
    // await this.emailService.sendPasswordReset({
    //   to: user.email,
    //   token: raw,
    // });
  }

  // ───────────────────────────────────────────────
  // POST /auth/password/reset
  // ───────────────────────────────────────────────
  async resetPassword(
    token: string,
    newPassword: string,
  ): Promise<{ success: boolean }> {
    const hash = sha256Hex(token);

    const rec = await this.resetRepo.findOne({
      where: { tokenHash: hash, used: false, expiresAt: MoreThan(new Date()) },
      relations: { user: true },
    });
    if (!rec) {
      fail(HttpStatus.UNAUTHORIZED, ERROR.INVALID_TOKEN, 'Invalid token');
    }

    // Prevent resets for inactive accounts
    if (!rec.user.isActive) {
      fail(HttpStatus.FORBIDDEN, ERROR.ACCOUNT_INACTIVE, 'Account inactive');
    }

    const newHash = await bcrypt.hash(newPassword, 12);
    await this.users.update(rec.user.id, { passwordHash: newHash });

    await this.sessions.revokeAllForUser(rec.user.id);

    rec.used = true;
    await this.resetRepo.save(rec);

    this.logger.log(`Password reset completed for ${rec.user.email}`);

    return { success: true };
  }

  // ───────────────────────────────────────────────
  // POST /auth/change-password
  // ───────────────────────────────────────────────
  async changePassword(
    userId: string,
    currentPassword: string,
    newPassword: string,
  ): Promise<{ success: boolean }> {
    const user = await this.users
      .createQueryBuilder('u')
      .addSelect('u.passwordHash')
      .where('u.id = :id', { id: userId })
      .getOne();

    if (!user) {
      fail(HttpStatus.UNAUTHORIZED, ERROR.UNAUTHORIZED, 'Unauthorized');
    }

    if (!user.isActive) {
      fail(HttpStatus.FORBIDDEN, ERROR.ACCOUNT_INACTIVE, 'Account inactive');
    }

    const valid = await bcrypt.compare(
      currentPassword,
      user.passwordHash ?? '',
    );
    if (!valid) {
      fail(
        HttpStatus.UNAUTHORIZED,
        ERROR.INVALID_CREDENTIALS,
        'Current password is incorrect.',
        {},
      );
    }

    const newHash = await bcrypt.hash(newPassword, 12);
    await this.users.update(user.id, { passwordHash: newHash });

    await this.sessions.revokeAllForUser(user.id);

    this.logger.log(`Password changed for user ${user.email}`);

    return { success: true };
  }
}
