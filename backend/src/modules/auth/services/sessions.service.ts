import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { In, LessThan, Repository } from 'typeorm';

import { Session } from '../entities/session.entity';
import { User } from '../entities/user.entity';

@Injectable()
export class SessionsService {
  constructor(
    @InjectRepository(Session)
    private readonly repo: Repository<Session>,
  ) {}

  computeExpiresAt(ttlSeconds: number): Date {
    return new Date(Date.now() + ttlSeconds * 1000);
  }

  async create(
    user: User,
    refreshTokenHash: string,
    expiresAt: Date,
    rememberMe: boolean,
    userAgent?: string | null,
    ipAddress?: string | null,
  ): Promise<Session> {
    const s = this.repo.create({
      user,
      refreshTokenHash,
      rememberMe,
      expiresAt,
      userAgent: userAgent ?? null,
      ipAddress: ipAddress ?? null,
    });
    return this.repo.save(s);
  }

  async rotateById(
    sessionId: string,
    newRefreshTokenHash: string,
    newExpiresAt: Date,
    userAgent?: string | null,
    ipAddress?: string | null,
  ): Promise<void> {
    await this.repo.update(sessionId, {
      refreshTokenHash: newRefreshTokenHash,
      expiresAt: newExpiresAt,
      userAgent: userAgent ?? null,
      ipAddress: ipAddress ?? null,
    });
  }

  async findById(id: string): Promise<Session | null> {
    return this.repo.findOne({
      where: { id },
      relations: { user: true },
    });
  }

  async revokeById(id: string): Promise<void> {
    await this.repo.delete(id);
  }

  async revokeAllForUser(userId: string): Promise<void> {
    await this.repo.delete({ user: { id: userId } as any });
  }

  async revokeAllForUsers(userIds: string[]): Promise<void> {
    if (!Array.isArray(userIds) || userIds.length === 0) return;
    await this.repo.delete({ user: { id: In(userIds) } as any });
  }

  async purgeExpired(now = new Date()): Promise<void> {
    await this.repo.delete({ expiresAt: LessThan(now) });
  }
}
