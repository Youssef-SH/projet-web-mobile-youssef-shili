import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { JwtModule } from '@nestjs/jwt';
import { ConfigModule, ConfigService } from '@nestjs/config';

import { User } from './entities/user.entity';
import { Session } from './entities/session.entity';
import { PasswordResetToken } from './entities/password-reset-token.entity';
import { UserInvite } from './entities/user-invite.entity';

import { Club } from '../clubs/entities/club.entity';
import { ClubLeader } from '../clubs/entities/club-leader.entity';

import { TokensService } from './services/tokens.service';
import { SessionsService } from './services/sessions.service';
import { AuthService } from './services/auth.service';
import { InvitesService } from './services/invites.service';
import { JwtStrategy } from './strategies/jwt.strategy';

import { AuthController } from './controllers/auth.controller';

@Module({
  imports: [
    ConfigModule,
    TypeOrmModule.forFeature([
      User,
      Session,
      PasswordResetToken,
      UserInvite,
      Club,
      ClubLeader,
    ]),
    JwtModule.registerAsync({
      imports: [ConfigModule],
      inject: [ConfigService],
      useFactory: (cfg: ConfigService) => ({
        secret: cfg.getOrThrow<string>('jwt.secret'),
        signOptions: { expiresIn: '15m' },
      }),
    }),
  ],
  controllers: [AuthController],
  providers: [
    TokensService,
    SessionsService,
    AuthService,
    InvitesService,
    JwtStrategy,
  ],
  exports: [AuthService, TokensService, SessionsService, InvitesService],
})
export class AuthModule {}
