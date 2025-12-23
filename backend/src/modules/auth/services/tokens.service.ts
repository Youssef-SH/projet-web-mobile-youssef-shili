import { Injectable } from '@nestjs/common';
import { JwtService } from '@nestjs/jwt';
import { ConfigService } from '@nestjs/config';

import { User } from '../entities/user.entity';
import { UserRole } from '../../../common/enums/user-role.enum';
import { ERROR } from 'src/common/constants/error-codes';
import { fail } from 'src/common/utils/fail.util';

export type AccessTokenPayload = { sub: string; role: UserRole; sid: string };
export type RefreshTokenPayload = { sub: string; sid: string; typ: 'refresh' };

@Injectable()
export class TokensService {
  constructor(
    private readonly jwt: JwtService,
    private readonly config: ConfigService,
  ) {}

  private accessSecret(): string {
    return this.config.getOrThrow<string>('JWT_SECRET');
  }

  private accessTtl(): number {
    return Number(this.config.get<string>('JWT_ACCESS_TTL_SECONDS', '900'));
  }

  private refreshSecret(): string {
    return this.config.getOrThrow<string>('JWT_REFRESH_SECRET');
  }

  private refreshTtl(rememberMe?: boolean): number {
    const web = Number(
      this.config.get<string>(
        'JWT_REFRESH_TTL_WEB_SECONDS',
        String(7 * 24 * 3600),
      ),
    );
    const mobile = Number(
      this.config.get<string>(
        'JWT_REFRESH_TTL_MOBILE_SECONDS',
        String(30 * 24 * 3600),
      ),
    );
    return rememberMe ? mobile : web;
  }

  getRefreshTtlSeconds(rememberMe?: boolean): number {
    return this.refreshTtl(rememberMe);
  }

  signAccessToken(user: User, sessionId: string): string {
    const payload: AccessTokenPayload = {
      sub: user.id,
      role: user.role,
      sid: sessionId,
    };

    return this.jwt.sign(payload, {
      secret: this.accessSecret(),
      expiresIn: this.accessTtl(),
    });
  }

  signRefreshToken(
    user: User,
    sessionId: string,
    rememberMe?: boolean,
  ): string {
    const payload: RefreshTokenPayload = {
      sub: user.id,
      sid: sessionId,
      typ: 'refresh',
    };

    return this.jwt.sign(payload, {
      secret: this.refreshSecret(),
      expiresIn: this.refreshTtl(rememberMe),
    });
  }

  verifyRefreshToken(token: string): RefreshTokenPayload {
    try {
      const payload = this.jwt.verify<RefreshTokenPayload>(token, {
        secret: this.refreshSecret(),
      });

      if (payload.typ !== 'refresh') {
        fail(401, ERROR.INVALID_TOKEN, 'Invalid refresh token');
      }

      return payload;
    } catch {
      fail(401, ERROR.INVALID_TOKEN, 'Invalid refresh token');
    }
  }
}
