import {
  Body,
  Controller,
  Get,
  HttpCode,
  HttpStatus,
  Patch,
  Post,
  Req,
  UploadedFile,
  UseInterceptors,
  ValidationPipe,
} from '@nestjs/common';
import {
  ApiAcceptedResponse,
  ApiBearerAuth,
  ApiBody,
  ApiConsumes,
  ApiConflictResponse,
  ApiExtraModels,
  ApiForbiddenResponse,
  ApiNotFoundResponse,
  ApiOkResponse,
  ApiOperation,
  ApiTags,
  ApiTooManyRequestsResponse,
  ApiUnprocessableEntityResponse,
  ApiUnauthorizedResponse,
  getSchemaPath,
} from '@nestjs/swagger';
import { FileInterceptor } from '@nestjs/platform-express';
import { Throttle } from '@nestjs/throttler';
import type { Request } from 'express';

import { AuthService } from '../services/auth.service';
import { InvitesService } from '../services/invites.service';

import { Roles } from '../../../common/decorators/roles.decorator';
import { CurrentUser } from '../../../common/decorators/current-user.decorator';
import { Public } from '../../../common/decorators/public.decorator';

import { UserRole } from '../../../common/enums/user-role.enum';

import {
  LoginDto,
  RefreshTokenDto,
  ForgotPasswordDto,
  ResetPasswordDto,
  InvitesPreviewDto,
  InvitesBulkDto,
  InvitesResendDto,
  AcceptStudentInviteDto,
  ChangePasswordDto,
  ReactivateAccountDto,
  AcceptClubScalarsDto,
} from '../dto/requests';

import {
  LoginResponseDto,
  RefreshResponseDto,
  MeResponseDto,
  ForgotPasswordResponseDto,
  ResetPasswordResponseDto,
  InvitesPreviewResponseDto,
  InvitesBulkResponseDto,
  InvitesResendResponseDto,
  AcceptStudentResponseDto,
  AcceptClubResponseDto,
  ChangePasswordResponseDto,
  ReactivateAccountResponseDto,
} from '../dto/responses';

import { ApiResponseDto } from 'src/common/dto/api-response.dto';
import { ERROR } from 'src/common/constants/error-codes';
import { validationError } from 'src/common/utils/fail.util';

import { multerCsvConfig } from 'src/config/multer/multer-csv.config';
import { multerImageConfig } from 'src/config/multer/multer-image.config';

import { JsonValidatePipe } from 'src/common/pipes/json-validate.pipe';
import { ClubLeaderInputDto } from 'src/common/dto/club-leader-input.dto';
import { ClubProfileDto } from 'src/common/dto/club-profile.dto';

import { extractRequestMeta } from 'src/common/utils/request-meta.util';
import { OptionalUploadValidationPipe } from 'src/common/pipes/optional-upload-validation.pipe';

@ApiTags('Auth')
@ApiExtraModels(
  ApiResponseDto,
  LoginResponseDto,
  RefreshResponseDto,
  MeResponseDto,
  ForgotPasswordResponseDto,
  ResetPasswordResponseDto,
  InvitesPreviewResponseDto,
  InvitesBulkResponseDto,
  InvitesResendResponseDto,
  AcceptStudentResponseDto,
  AcceptClubResponseDto,
  ChangePasswordResponseDto,
  ReactivateAccountResponseDto,
)
@Controller('auth')
export class AuthController {
  constructor(
    private readonly auth: AuthService,
    private readonly invites: InvitesService,
  ) {}

  // ──────────────────────────────────────────────
  // POST /auth/login
  // ──────────────────────────────────────────────
  @Public()
  @Throttle({ default: { limit: 5, ttl: 60 } })
  @HttpCode(HttpStatus.OK)
  @Post('login')
  @ApiOperation({
    summary: 'Login and issue access + refresh tokens',
    operationId: 'auth_login',
  })
  @ApiOkResponse({
    description: 'Login successful',
    schema: {
      allOf: [
        { $ref: getSchemaPath(ApiResponseDto) },
        {
          properties: {
            data: { $ref: getSchemaPath(LoginResponseDto) },
            code: { example: 'OK' },
            message: { example: 'Login successful' },
          },
        },
      ],
    },
  })
  @ApiUnprocessableEntityResponse({
    description: 'Validation failed',
    schema: {
      allOf: [
        { $ref: getSchemaPath(ApiResponseDto) },
        {
          properties: {
            code: { example: ERROR.VALIDATION_ERROR },
            message: { example: 'Validation failed' },
            details: {
              example: {
                field: ['Validation error message'],
              },
            },
          },
        },
      ],
    },
  })
  @ApiUnauthorizedResponse({
    description: 'Bad credentials or inactive account',
    schema: {
      allOf: [
        { $ref: getSchemaPath(ApiResponseDto) },
        {
          properties: {
            code: { example: ERROR.INVALID_CREDENTIALS },
            message: { example: 'Invalid email or password' },
          },
        },
      ],
    },
  })
  @ApiTooManyRequestsResponse({
    description: 'Too many login attempts. Try again later.',
    schema: {
      allOf: [
        { $ref: getSchemaPath(ApiResponseDto) },
        {
          properties: {
            code: { example: ERROR.RATE_LIMIT_EXCEEDED },
            message: {
              example: 'Too many requests. Please wait before retrying.',
            },
          },
        },
      ],
    },
  })
  async login(
    @Body() dto: LoginDto,
    @Req() req: Request,
  ): Promise<LoginResponseDto> {
    const { userAgent, ipAddress } = extractRequestMeta(req);

    return this.auth.login(
      {
        email: dto.email,
        password: dto.password,
        rememberMe: dto.rememberMe,
      },
      userAgent ?? undefined,
      ipAddress ?? undefined,
    );
  }

  // ──────────────────────────────────────────────
  // POST /auth/refresh
  // ──────────────────────────────────────────────
  @Public()
  @HttpCode(HttpStatus.OK)
  @Post('refresh')
  @ApiOperation({
    summary: 'Rotate refresh token → new access + refresh pair',
    operationId: 'auth_refresh',
  })
  @ApiOkResponse({
    description: 'Tokens refreshed',
    schema: {
      allOf: [
        { $ref: getSchemaPath(ApiResponseDto) },
        {
          properties: {
            data: { $ref: getSchemaPath(RefreshResponseDto) },
            code: { example: 'OK' },
            message: { example: 'Tokens refreshed' },
          },
        },
      ],
    },
  })
  @ApiUnprocessableEntityResponse({
    description: 'Validation failed',
    schema: {
      allOf: [
        { $ref: getSchemaPath(ApiResponseDto) },
        {
          properties: {
            code: { example: ERROR.VALIDATION_ERROR },
            message: { example: 'Validation failed' },
            details: {
              example: {
                field: ['Validation error message'],
              },
            },
          },
        },
      ],
    },
  })
  @ApiUnauthorizedResponse({
    description: 'Refresh token expired or revoked',
    schema: {
      allOf: [
        { $ref: getSchemaPath(ApiResponseDto) },
        {
          properties: {
            code: { example: ERROR.INVALID_TOKEN },
            message: { example: 'Invalid or expired token' },
          },
        },
      ],
    },
  })
  async refresh(
    @Body() dto: RefreshTokenDto,
    @Req() req: Request,
  ): Promise<RefreshResponseDto> {
    const { userAgent, ipAddress } = extractRequestMeta(req);

    return this.auth.refresh(
      dto.refreshToken,
      userAgent ?? undefined,
      ipAddress ?? undefined,
    );
  }

  // ──────────────────────────────────────────────
  // POST /auth/logout
  // ──────────────────────────────────────────────
  @HttpCode(HttpStatus.OK)
  @Post('logout')
  @ApiBearerAuth()
  @ApiOperation({
    summary: 'Revoke the current session',
    operationId: 'auth_logout',
    description:
      'Invalidates the current session and refresh token. User must log in again.',
  })
  @ApiOkResponse({
    description: 'Logged out successfully',
    schema: {
      allOf: [
        { $ref: getSchemaPath(ApiResponseDto) },
        {
          properties: {
            data: { example: null },
            code: { example: 'OK' },
            message: { example: 'Logged out successfully' },
          },
        },
      ],
    },
  })
  async logout(
    @CurrentUser() user: { id: string; sid: string },
  ): Promise<void> {
    await this.auth.logout({ sid: user.sid });
  }

  // ──────────────────────────────────────────────
  // GET /auth/me
  // ──────────────────────────────────────────────
  @Get('me')
  @ApiBearerAuth()
  @ApiOperation({
    summary: 'Get current authenticated user profile',
    operationId: 'auth_me',
  })
  @ApiOkResponse({
    description: 'Profile retrieved',
    schema: {
      allOf: [
        { $ref: getSchemaPath(ApiResponseDto) },
        {
          properties: {
            data: { $ref: getSchemaPath(MeResponseDto) },
            code: { example: 'OK' },
            message: { example: 'Profile retrieved' },
          },
        },
      ],
    },
  })
  @ApiUnauthorizedResponse({
    description: 'No valid session / token missing',
    schema: {
      allOf: [
        { $ref: getSchemaPath(ApiResponseDto) },
        {
          properties: {
            code: { example: ERROR.INVALID_CREDENTIALS },
            message: { example: 'Unauthorized' },
          },
        },
      ],
    },
  })
  async me(
    @CurrentUser() user: { id: string; role: UserRole },
  ): Promise<MeResponseDto> {
    return this.auth.me(user.id);
  }

  // ──────────────────────────────────────────────
  // POST /auth/password/forgot
  // ──────────────────────────────────────────────
  @Public()
  @Throttle({ default: { limit: 3, ttl: 60 } })
  @Post('password/forgot')
  @HttpCode(HttpStatus.ACCEPTED)
  @ApiOperation({
    summary: 'Start password reset flow (always returns 202)',
    operationId: 'auth_forgotPassword',
  })
  @ApiAcceptedResponse({
    description: 'If this email exists, a reset link was sent.',
    schema: {
      allOf: [
        { $ref: getSchemaPath(ApiResponseDto) },
        {
          properties: {
            data: { $ref: getSchemaPath(ForgotPasswordResponseDto) },
            code: { example: 'ACCEPTED' },
            message: { example: 'Password reset initiated' },
          },
        },
      ],
    },
  })
  @ApiUnprocessableEntityResponse({
    description: 'Validation failed',
    schema: {
      allOf: [
        { $ref: getSchemaPath(ApiResponseDto) },
        {
          properties: {
            code: { example: ERROR.VALIDATION_ERROR },
            message: { example: 'Validation failed' },
            details: {
              example: {
                field: ['Validation error message'],
              },
            },
          },
        },
      ],
    },
  })
  @ApiTooManyRequestsResponse({
    description:
      'Too many password reset requests. Please wait before retrying.',
    schema: {
      allOf: [
        { $ref: getSchemaPath(ApiResponseDto) },
        {
          properties: {
            code: { example: ERROR.RATE_LIMIT_EXCEEDED },
            message: {
              example: 'Too many requests. Please wait before retrying.',
            },
          },
        },
      ],
    },
  })
  async forgotPassword(
    @Body() dto: ForgotPasswordDto,
  ): Promise<ForgotPasswordResponseDto> {
    await this.auth.forgotPassword(dto.email);
    return { message: 'If this email exists, a reset link was sent.' };
  }

  // ──────────────────────────────────────────────
  // POST /auth/password/reset
  // ──────────────────────────────────────────────
  @Public()
  @Throttle({ default: { limit: 5, ttl: 60 } })
  @HttpCode(HttpStatus.OK)
  @Post('password/reset')
  @ApiOperation({
    summary: 'Complete password reset and revoke all sessions',
    operationId: 'auth_resetPassword',
  })
  @ApiOkResponse({
    description: 'Password reset successful',
    schema: {
      allOf: [
        { $ref: getSchemaPath(ApiResponseDto) },
        {
          properties: {
            data: { $ref: getSchemaPath(ResetPasswordResponseDto) },
            code: { example: 'OK' },
            message: { example: 'Password reset successful' },
          },
        },
      ],
    },
  })
  @ApiUnprocessableEntityResponse({
    description: 'Validation failed',
    schema: {
      allOf: [
        { $ref: getSchemaPath(ApiResponseDto) },
        {
          properties: {
            code: { example: ERROR.VALIDATION_ERROR },
            message: { example: 'Validation failed' },
            details: {
              example: {
                field: ['Validation error message'],
              },
            },
          },
        },
      ],
    },
  })
  @ApiUnauthorizedResponse({
    description: 'Reset token expired / already used',
    schema: {
      allOf: [
        { $ref: getSchemaPath(ApiResponseDto) },
        {
          properties: {
            code: { example: ERROR.INVALID_TOKEN },
            message: { example: 'Invalid or expired token' },
          },
        },
      ],
    },
  })
  @ApiTooManyRequestsResponse({
    description: 'Too many password reset attempts. Try again later.',
    schema: {
      allOf: [
        { $ref: getSchemaPath(ApiResponseDto) },
        {
          properties: {
            code: { example: ERROR.RATE_LIMIT_EXCEEDED },
            message: {
              example: 'Too many requests. Please wait before retrying.',
            },
          },
        },
      ],
    },
  })
  async resetPassword(
    @Body() dto: ResetPasswordDto,
  ): Promise<ResetPasswordResponseDto> {
    await this.auth.resetPassword(dto.token, dto.newPassword);
    return { success: true };
  }

  // ──────────────────────────────────────────────
  // PATCH /auth/password/change
  // ──────────────────────────────────────────────
  @Patch('password/change')
  @ApiBearerAuth()
  @ApiOperation({
    summary: 'Change password (authenticated user)',
    description:
      'Requires the current password. On success, all sessions are revoked and a re-login is required.',
    operationId: 'auth_changePassword',
  })
  @ApiOkResponse({
    description: 'Password updated successfully',
    schema: {
      allOf: [
        { $ref: getSchemaPath(ApiResponseDto) },
        {
          properties: {
            data: { $ref: getSchemaPath(ChangePasswordResponseDto) },
            code: { example: 'OK' },
            message: { example: 'Password updated successfully' },
          },
        },
      ],
    },
  })
  @ApiUnprocessableEntityResponse({
    description: 'Validation failed',
    schema: {
      allOf: [
        { $ref: getSchemaPath(ApiResponseDto) },
        {
          properties: {
            code: { example: ERROR.VALIDATION_ERROR },
            message: { example: 'Validation failed' },
            details: {
              example: {
                field: ['Validation error message'],
              },
            },
          },
        },
      ],
    },
  })
  @ApiUnauthorizedResponse({
    description: 'Invalid/expired session',
    schema: {
      allOf: [
        { $ref: getSchemaPath(ApiResponseDto) },
        {
          properties: {
            code: { example: ERROR.INVALID_CREDENTIALS },
            message: { example: 'Unauthorized' },
          },
        },
      ],
    },
  })
  @ApiForbiddenResponse({
    description: 'Account not allowed',
    schema: {
      allOf: [
        { $ref: getSchemaPath(ApiResponseDto) },
        {
          properties: {
            code: { example: ERROR.FORBIDDEN },
            message: { example: 'Forbidden' },
          },
        },
      ],
    },
  })
  async changePassword(
    @CurrentUser() user: { id: string },
    @Body() dto: ChangePasswordDto,
  ): Promise<ChangePasswordResponseDto> {
    await this.auth.changePassword(
      user.id,
      dto.currentPassword,
      dto.newPassword,
    );
    return { success: true, message: 'Password updated successfully.' };
  }

  // ──────────────────────────────────────────────
  // POST /auth/invites/preview (Admin)
  // ──────────────────────────────────────────────
  @HttpCode(HttpStatus.OK)
  @Post('invites/preview')
  @ApiBearerAuth()
  @Roles(UserRole.ADMIN)
  @ApiOperation({
    summary: 'Dry-run CSV import (no DB changes)',
    operationId: 'auth_invitesPreview',
  })
  @ApiConsumes('multipart/form-data')
  @ApiBody({
    schema: {
      type: 'object',
      properties: {
        accountType: { type: 'string', enum: ['Student', 'Club'] },
        mode: { type: 'string', enum: ['add', 'replace'] },
        file: { type: 'string', format: 'binary' },
      },
      required: ['accountType', 'mode', 'file'],
    },
  })
  @ApiOkResponse({
    description: 'Preview summary produced successfully',
    schema: {
      allOf: [
        { $ref: getSchemaPath(ApiResponseDto) },
        {
          properties: {
            data: { $ref: getSchemaPath(InvitesPreviewResponseDto) },
            code: { example: 'OK' },
            message: { example: 'Preview generated' },
          },
        },
      ],
    },
  })
  @ApiUnprocessableEntityResponse({
    description: 'Validation failed',
    schema: {
      allOf: [
        { $ref: getSchemaPath(ApiResponseDto) },
        {
          properties: {
            code: { example: ERROR.VALIDATION_ERROR },
            message: { example: 'Validation failed' },
            details: {
              example: {
                field: ['Validation error message'],
              },
            },
          },
        },
      ],
    },
  })
  @ApiUnauthorizedResponse({
    description: 'Unauthenticated',
    schema: {
      allOf: [
        { $ref: getSchemaPath(ApiResponseDto) },
        {
          properties: {
            code: { example: ERROR.INVALID_CREDENTIALS },
            message: { example: 'Unauthorized' },
          },
        },
      ],
    },
  })
  @ApiForbiddenResponse({
    description: 'Caller is not an Admin',
    schema: {
      allOf: [
        { $ref: getSchemaPath(ApiResponseDto) },
        {
          properties: {
            code: { example: ERROR.FORBIDDEN },
            message: { example: 'Forbidden' },
          },
        },
      ],
    },
  })
  @UseInterceptors(FileInterceptor('file', multerCsvConfig))
  async previewInvites(
    @Body() dto: InvitesPreviewDto,
    @UploadedFile() file?: Express.Multer.File,
  ): Promise<InvitesPreviewResponseDto> {
    if (!file || !file.buffer?.length) {
      validationError(
        'No CSV content detected. Please upload a valid CSV file.',
      );
      throw new Error('Unreachable');
    }

    const csvText = file.buffer.toString('utf-8');
    return this.invites.preview(dto.accountType, dto.mode, csvText);
  }

  // ──────────────────────────────────────────────
  // POST /auth/invites/bulk (Admin)
  // ──────────────────────────────────────────────
  @HttpCode(HttpStatus.OK)
  @Post('invites/bulk')
  @ApiBearerAuth()
  @Roles(UserRole.ADMIN)
  @ApiOperation({
    summary: 'Apply CSV import',
    operationId: 'auth_invitesBulk',
  })
  @ApiConsumes('multipart/form-data')
  @ApiBody({
    schema: {
      type: 'object',
      properties: {
        accountType: { type: 'string', enum: ['Student', 'Club'] },
        mode: { type: 'string', enum: ['add', 'replace'] },
        confirm: { type: 'string', example: 'CONFIRM' },
        file: { type: 'string', format: 'binary' },
      },
      required: ['accountType', 'mode', 'file'],
    },
  })
  @ApiOkResponse({
    description: 'Bulk import applied',
    schema: {
      allOf: [
        { $ref: getSchemaPath(ApiResponseDto) },
        {
          properties: {
            data: { $ref: getSchemaPath(InvitesBulkResponseDto) },
            code: { example: 'OK' },
            message: { example: 'Bulk import applied' },
          },
        },
      ],
    },
  })
  @ApiUnprocessableEntityResponse({
    description: 'Validation failed',
    schema: {
      allOf: [
        { $ref: getSchemaPath(ApiResponseDto) },
        {
          properties: {
            code: { example: ERROR.VALIDATION_ERROR },
            message: { example: 'Validation failed' },
            details: {
              example: {
                field: ['Validation error message'],
              },
            },
          },
        },
      ],
    },
  })
  @ApiUnauthorizedResponse({
    description: 'Unauthenticated',
    schema: {
      allOf: [
        { $ref: getSchemaPath(ApiResponseDto) },
        {
          properties: {
            code: { example: ERROR.INVALID_CREDENTIALS },
            message: { example: 'Unauthorized' },
          },
        },
      ],
    },
  })
  @ApiForbiddenResponse({
    description: 'Caller is not an Admin',
    schema: {
      allOf: [
        { $ref: getSchemaPath(ApiResponseDto) },
        {
          properties: {
            code: { example: ERROR.FORBIDDEN },
            message: { example: 'Forbidden' },
          },
        },
      ],
    },
  })
  @UseInterceptors(FileInterceptor('file', multerCsvConfig))
  async bulkInvites(
    @Body() dto: InvitesBulkDto,
    @UploadedFile() file?: Express.Multer.File,
  ): Promise<InvitesBulkResponseDto> {
    if (!file || !file.buffer?.length) {
      validationError(
        'No CSV content detected. Please upload a valid CSV file.',
      );
      throw new Error('Unreachable');
    }

    const csvText = file.buffer.toString('utf-8');
    return this.invites.bulk(dto.accountType, dto.mode, csvText, dto.confirm);
  }

  // ──────────────────────────────────────────────
  // POST /auth/invites/resend (Admin) — always 202
  // ──────────────────────────────────────────────
  @Post('invites/resend')
  @ApiBearerAuth()
  @Roles(UserRole.ADMIN)
  @HttpCode(HttpStatus.ACCEPTED)
  @ApiOperation({
    summary: 'Resend invite emails to pending users',
    operationId: 'auth_invitesResend',
  })
  @ApiAcceptedResponse({
    description: 'Resend operation processed',
    schema: {
      allOf: [
        { $ref: getSchemaPath(ApiResponseDto) },
        {
          properties: {
            data: { $ref: getSchemaPath(InvitesResendResponseDto) },
            code: { example: 'ACCEPTED' },
            message: { example: 'Resend processed' },
          },
        },
      ],
    },
  })
  @ApiUnprocessableEntityResponse({
    description: 'Validation failed',
    schema: {
      allOf: [
        { $ref: getSchemaPath(ApiResponseDto) },
        {
          properties: {
            code: { example: ERROR.VALIDATION_ERROR },
            message: { example: 'Validation failed' },
            details: {
              example: {
                field: ['Validation error message'],
              },
            },
          },
        },
      ],
    },
  })
  @ApiUnauthorizedResponse({
    description: 'Unauthenticated',
    schema: {
      allOf: [
        { $ref: getSchemaPath(ApiResponseDto) },
        {
          properties: {
            code: { example: ERROR.INVALID_CREDENTIALS },
            message: { example: 'Unauthorized' },
          },
        },
      ],
    },
  })
  @ApiForbiddenResponse({
    description: 'Caller is not an Admin',
    schema: {
      allOf: [
        { $ref: getSchemaPath(ApiResponseDto) },
        {
          properties: {
            code: { example: ERROR.FORBIDDEN },
            message: { example: 'Forbidden' },
          },
        },
      ],
    },
  })
  async resendInvites(
    @Body() dto: InvitesResendDto,
  ): Promise<InvitesResendResponseDto> {
    return this.invites.resend(dto.emails);
  }

  // ──────────────────────────────────────────────
  // POST /auth/accounts/reactivate (Admin)
  // ──────────────────────────────────────────────
  @HttpCode(HttpStatus.OK)
  @Post('accounts/reactivate')
  @ApiBearerAuth()
  @Roles(UserRole.ADMIN)
  @ApiOperation({
    summary: 'Reactivate an inactive account by issuing a fresh invite',
    description:
      'Reactivates a previously deactivated Student/Club account by issuing a new pending invite (optionally updating the email) and revoking all previous sessions.',
    operationId: 'auth_reactivateAccount',
  })
  @ApiOkResponse({
    description: 'Reactivation invite issued',
    schema: {
      allOf: [
        { $ref: getSchemaPath(ApiResponseDto) },
        {
          properties: {
            data: { $ref: getSchemaPath(ReactivateAccountResponseDto) },
            code: { example: 'OK' },
            message: { example: 'Reactivation invite issued' },
          },
        },
      ],
    },
  })
  @ApiUnprocessableEntityResponse({
    description: 'Validation failed',
    schema: {
      allOf: [
        { $ref: getSchemaPath(ApiResponseDto) },
        {
          properties: {
            code: { example: ERROR.VALIDATION_ERROR },
            message: { example: 'Validation failed' },
            details: {
              example: {
                field: ['Validation error message'],
              },
            },
          },
        },
      ],
    },
  })
  @ApiNotFoundResponse({
    description: 'User not found',
    schema: {
      allOf: [
        { $ref: getSchemaPath(ApiResponseDto) },
        {
          properties: {
            code: { example: ERROR.NOT_FOUND },
            message: { example: 'Not found' },
          },
        },
      ],
    },
  })
  @ApiConflictResponse({
    description:
      'User is already active / email conflict / invalid role for reactivation',
    schema: {
      allOf: [
        { $ref: getSchemaPath(ApiResponseDto) },
        {
          properties: {
            code: { example: ERROR.CONFLICT },
            message: { example: 'Conflict' },
          },
        },
      ],
    },
  })
  @ApiUnauthorizedResponse({
    description: 'Unauthenticated',
    schema: {
      allOf: [
        { $ref: getSchemaPath(ApiResponseDto) },
        {
          properties: {
            code: { example: ERROR.INVALID_CREDENTIALS },
            message: { example: 'Unauthorized' },
          },
        },
      ],
    },
  })
  @ApiForbiddenResponse({
    description: 'Caller is not an Admin',
    schema: {
      allOf: [
        { $ref: getSchemaPath(ApiResponseDto) },
        {
          properties: {
            code: { example: ERROR.FORBIDDEN },
            message: { example: 'Forbidden' },
          },
        },
      ],
    },
  })
  async reactivateAccount(
    @Body() dto: ReactivateAccountDto,
  ): Promise<ReactivateAccountResponseDto> {
    return this.invites.reactivate(dto.userId, dto.newEmail);
  }

  // ──────────────────────────────────────────────
  // POST /auth/invites/accept/student (Public)
  // ──────────────────────────────────────────────
  @Public()
  @HttpCode(HttpStatus.OK)
  @Throttle({ default: { limit: 5, ttl: 60 } })
  @Post('invites/accept/student')
  @ApiOperation({
    summary: 'Accept Student invite',
    operationId: 'auth_acceptStudentInvite',
  })
  @ApiOkResponse({
    description: 'Student account created/reactivated and session issued',
    schema: {
      allOf: [
        { $ref: getSchemaPath(ApiResponseDto) },
        {
          properties: {
            data: { $ref: getSchemaPath(AcceptStudentResponseDto) },
            code: { example: 'OK' },
            message: { example: 'Invite accepted. Session issued.' },
          },
        },
      ],
    },
  })
  @ApiUnprocessableEntityResponse({
    description: 'Validation failed',
    schema: {
      allOf: [
        { $ref: getSchemaPath(ApiResponseDto) },
        {
          properties: {
            code: { example: ERROR.VALIDATION_ERROR },
            message: { example: 'Validation failed' },
            details: {
              example: {
                field: ['Validation error message'],
              },
            },
          },
        },
      ],
    },
  })
  @ApiUnauthorizedResponse({
    description: 'Invite already used / token expired',
    schema: {
      allOf: [
        { $ref: getSchemaPath(ApiResponseDto) },
        {
          properties: {
            code: { example: ERROR.INVALID_TOKEN },
            message: { example: 'Invalid or expired invite token' },
          },
        },
      ],
    },
  })
  @ApiForbiddenResponse({
    description: 'Invite not allowed',
    schema: {
      allOf: [
        { $ref: getSchemaPath(ApiResponseDto) },
        {
          properties: {
            code: { example: ERROR.FORBIDDEN },
            message: { example: 'Forbidden' },
          },
        },
      ],
    },
  })
  async acceptStudent(
    @Body() dto: AcceptStudentInviteDto,
    @Req() req: Request,
  ): Promise<AcceptStudentResponseDto> {
    const { userAgent, ipAddress } = extractRequestMeta(req);

    return this.invites.acceptStudent({
      token: dto.token,
      password: dto.password,
      fullName: dto.fullName,
      userAgent,
      ipAddress,
    });
  }

  // ──────────────────────────────────────────────
  // POST /auth/invites/accept/club (Public, multipart)
  // ──────────────────────────────────────────────
  @Public()
  @HttpCode(HttpStatus.OK)
  @Throttle({ default: { limit: 3, ttl: 60 } })
  @Post('invites/accept/club')
  @UseInterceptors(FileInterceptor('logo', multerImageConfig))
  @ApiConsumes('multipart/form-data')
  @ApiOperation({
    summary: 'Accept Club invite (creates/rehydrates club + 2 leaders)',
    operationId: 'auth_acceptClubInvite',
  })
  @ApiBody({
    schema: {
      type: 'object',
      properties: {
        token: { type: 'string', example: 'invite-token-value' },
        password: { type: 'string', example: 'StrongPass123!' },
        club: {
          type: 'string',
          description: 'JSON string for club profile (name, description)',
          example: JSON.stringify({
            name: 'IEEE ISIMM',
            description:
              'A student-led community promoting innovation and technology.',
          }),
        },
        leaders: {
          type: 'string',
          description: 'JSON string array of exactly 2 leaders',
          example: JSON.stringify([
            {
              role: 'President',
              fullName: 'Alice Mansouri',
              email: 'alice@isimm.tn',
              phone: '22123456',
              cin: '12345678',
              studyLevel: 'ING2',
              specialization: 'GL',
            },
            {
              role: 'VicePresident',
              fullName: 'Bob Ben Ahmed',
              email: 'bob@isimm.tn',
              phone: '22987654',
              cin: '87654321',
              studyLevel: 'ING1',
              specialization: 'INFO',
            },
          ]),
        },
        logo: { type: 'string', format: 'binary' },
      },
      required: ['token', 'password', 'club', 'leaders'],
    },
  })
  @ApiOkResponse({
    description:
      'Club account created/reactivated, leaders saved, and session issued',
    schema: {
      allOf: [
        { $ref: getSchemaPath(ApiResponseDto) },
        {
          properties: {
            data: { $ref: getSchemaPath(AcceptClubResponseDto) },
            code: { example: 'OK' },
            message: {
              example: 'Invite accepted. Club created & session issued.',
            },
          },
        },
      ],
    },
  })
  @ApiUnprocessableEntityResponse({
    description: 'Validation failed',
    schema: {
      allOf: [
        { $ref: getSchemaPath(ApiResponseDto) },
        {
          properties: {
            code: { example: ERROR.VALIDATION_ERROR },
            message: { example: 'Validation failed' },
            details: {
              example: {
                field: ['Validation error message'],
              },
            },
          },
        },
      ],
    },
  })
  @ApiUnauthorizedResponse({
    description: 'Invite already used / token expired',
    schema: {
      allOf: [
        { $ref: getSchemaPath(ApiResponseDto) },
        {
          properties: {
            code: { example: ERROR.INVALID_TOKEN },
            message: { example: 'Invalid or expired invite token' },
          },
        },
      ],
    },
  })
  @ApiForbiddenResponse({
    description: 'Invite not allowed / club cannot be created',
    schema: {
      allOf: [
        { $ref: getSchemaPath(ApiResponseDto) },
        {
          properties: {
            code: { example: ERROR.FORBIDDEN },
            message: { example: 'Forbidden' },
          },
        },
      ],
    },
  })
  @ApiConflictResponse({
    description:
      'Account conflict (email already used, active account, wrong role, etc.)',
    schema: {
      allOf: [
        { $ref: getSchemaPath(ApiResponseDto) },
        {
          properties: {
            code: { example: ERROR.CONFLICT },
            message: { example: 'Conflict' },
          },
        },
      ],
    },
  })
  async acceptClub(
    @UploadedFile(OptionalUploadValidationPipe)
    logo: Express.Multer.File | undefined,
    @Req() req: Request,
    @Body(
      new ValidationPipe({
        transform: true,
        whitelist: true,
        forbidNonWhitelisted: false,
      }),
    )
    scalars: AcceptClubScalarsDto,
    @Body('club', new JsonValidatePipe(ClubProfileDto))
    club: ClubProfileDto,
    @Body('leaders', new JsonValidatePipe(ClubLeaderInputDto, true))
    leaders: ClubLeaderInputDto[],
  ): Promise<AcceptClubResponseDto> {
    const { userAgent, ipAddress } = extractRequestMeta(req);

    return this.invites.acceptClub({
      token: scalars.token,
      password: scalars.password,
      userAgent,
      ipAddress,
      club: {
        name: club.name,
        description: club.description,
        logo: logo ?? null,
      },
      leaders,
    });
  }
}
