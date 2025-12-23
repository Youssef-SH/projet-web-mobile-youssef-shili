import {
  Body,
  Controller,
  Delete,
  Get,
  HttpCode,
  HttpStatus,
  Param,
  Patch,
  Post,
  Put,
  Query,
  Req,
  Res,
  StreamableFile,
  UploadedFile,
  UseGuards,
  UseInterceptors,
} from '@nestjs/common';
import {
  ApiBearerAuth,
  ApiBody,
  ApiConsumes,
  ApiConflictResponse,
  ApiExtraModels,
  ApiForbiddenResponse,
  ApiNotFoundResponse,
  ApiOkResponse,
  ApiOperation,
  ApiParam,
  ApiProduces,
  ApiTags,
  ApiUnauthorizedResponse,
  ApiUnprocessableEntityResponse,
  getSchemaPath,
} from '@nestjs/swagger';
import { FileInterceptor } from '@nestjs/platform-express';
import type { Request, Response } from 'express';

import { ClubsService } from '../services/clubs.service';

import { Roles } from '../../../common/decorators/roles.decorator';
import { CurrentUser } from '../../../common/decorators/current-user.decorator';
import { Public } from '../../../common/decorators/public.decorator';

import { UserRole } from '../../../common/enums/user-role.enum';
import { ERROR } from '../../../common/constants/error-codes';

import {
  UpdateClubProfileDto,
  UpdateClubLeadersDto,
  AdminRenameClubDto,
  GenerateAnnualReportDto,
} from '../dto/requests';

import {
  ClubsListResponseDto,
  ClubPublicHeaderResponseDto,
  ClubSelfProfileResponseDto,
  UpdateClubProfileResponseDto,
  UpdateClubLeadersResponseDto,
  ClubLeadersResponseDto,
  SubscribeClubResponseDto,
  AdminRenameClubResponseDto,
} from '../dto/responses';

import { multerImageConfig } from '../../../config/multer/multer-image.config';
import { ApiResponseDto } from '../../../common/dto/api-response.dto';
import { OptionalJwtAuthGuard } from '../../../common/guards/optional-jwt-auth.guard';
import { OptionalUploadValidationPipe } from 'src/common/pipes/optional-upload-validation.pipe';

@ApiTags('Clubs')
@ApiExtraModels(
  ApiResponseDto,
  ClubsListResponseDto,
  ClubPublicHeaderResponseDto,
  ClubSelfProfileResponseDto,
  UpdateClubProfileResponseDto,
  UpdateClubLeadersResponseDto,
  ClubLeadersResponseDto,
  SubscribeClubResponseDto,
  AdminRenameClubResponseDto,
)
@Controller('clubs')
export class ClubsController {
  constructor(private readonly clubs: ClubsService) {}

  // GET /clubs – public directory of active clubs
  @Public()
  @Get()
  @ApiOperation({
    summary: 'List all active clubs',
    description: 'Returns minimal public cards for all active clubs.',
    operationId: 'clubs_list',
  })
  @ApiOkResponse({
    description: 'List of clubs returned successfully',
    schema: {
      allOf: [
        { $ref: getSchemaPath(ApiResponseDto) },
        {
          properties: {
            data: { $ref: getSchemaPath(ClubsListResponseDto) },
            code: { example: 'OK' },
            message: { example: 'Clubs fetched' },
          },
        },
      ],
    },
  })
  async listClubs(): Promise<ClubsListResponseDto> {
    const rows = await this.clubs.listClubs();
    return { clubs: rows };
  }

  // GET /clubs/me – club self-profile view
  @Get('me')
  @ApiBearerAuth()
  @Roles(UserRole.CLUB)
  @ApiOperation({
    summary: 'Get current club profile (self view)',
    description:
      'Returns editable profile data (description, logo, leaders) for the authenticated club account.',
    operationId: 'clubs_getOwnProfile',
  })
  @ApiOkResponse({
    description: 'Club profile fetched',
    schema: {
      allOf: [
        { $ref: getSchemaPath(ApiResponseDto) },
        {
          properties: {
            data: { $ref: getSchemaPath(ClubSelfProfileResponseDto) },
            code: { example: 'OK' },
            message: { example: 'Club profile fetched' },
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
            code: { example: ERROR.UNAUTHORIZED },
            message: { example: 'Unauthorized' },
          },
        },
      ],
    },
  })
  async getOwnClubProfile(
    @CurrentUser() user: { id: string },
  ): Promise<ClubSelfProfileResponseDto> {
    const result = await this.clubs.getOwnClubProfile(user.id);
    return result;
  }

  // PATCH /clubs/me – update description and/or logo
  @Patch('me')
  @ApiBearerAuth()
  @Roles(UserRole.CLUB)
  @UseInterceptors(FileInterceptor('logo', multerImageConfig))
  @ApiConsumes('multipart/form-data')
  @ApiOperation({
    summary: 'Update current club profile',
    operationId: 'clubs_updateProfile',
  })
  @ApiBody({
    schema: {
      type: 'object',
      properties: {
        description: {
          type: 'string',
          example: 'We build robots, run competitions, and mentor juniors.',
          description:
            'Short public description of the club for the directory page.',
        },
        logo: {
          type: 'string',
          format: 'binary',
          description: 'New logo file to upload (image). Optional.',
        },
      },
    },
  })
  @ApiOkResponse({
    description: 'Club profile updated successfully',
    schema: {
      allOf: [
        { $ref: getSchemaPath(ApiResponseDto) },
        {
          properties: {
            data: { $ref: getSchemaPath(UpdateClubProfileResponseDto) },
            code: { example: 'OK' },
            message: { example: 'Club profile updated' },
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
            code: { example: ERROR.UNAUTHORIZED },
            message: { example: 'Unauthorized' },
          },
        },
      ],
    },
  })
  async updateClubProfile(
    @CurrentUser() user: { id: string },
    @Body() dto: UpdateClubProfileDto,
    @UploadedFile(OptionalUploadValidationPipe)
    logo?: Express.Multer.File,
  ): Promise<UpdateClubProfileResponseDto> {
    return this.clubs.updateClubProfile(
      user.id,
      { description: dto.description },
      logo,
    );
  }

  // PUT /clubs/me/leaders – atomically replace both leaders (President & VP)
  @Put('me/leaders')
  @ApiBearerAuth()
  @Roles(UserRole.CLUB)
  @ApiOperation({
    summary: 'Replace club leadership (President & VicePresident)',
    description:
      'Exactly two leaders must be provided: President and VicePresident. Fully replaces previous leaders.',
    operationId: 'clubs_replaceLeaders',
  })
  @ApiOkResponse({
    description: 'Leaders replaced',
    schema: {
      allOf: [
        { $ref: getSchemaPath(ApiResponseDto) },
        {
          properties: {
            data: { $ref: getSchemaPath(UpdateClubLeadersResponseDto) },
            code: { example: 'OK' },
            message: { example: 'Leaders replaced' },
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
            code: { example: ERROR.UNAUTHORIZED },
            message: { example: 'Unauthorized' },
          },
        },
      ],
    },
  })
  async replaceClubLeaders(
    @CurrentUser() user: { id: string },
    @Body() dto: UpdateClubLeadersDto,
  ): Promise<UpdateClubLeadersResponseDto> {
    const result = await this.clubs.replaceClubLeaders(user.id, {
      leaders: dto.leaders,
    });
    return result;
  }

  // GET /clubs/reports
  // Generates a GLOBAL annual report PDF, stores it, and records metadata.
  @Get('reports')
  @ApiBearerAuth()
  @Roles(UserRole.ADMIN)
  @ApiOperation({
    summary: 'Generate global annual report',
    description:
      'Admins may generate a global institute-wide annual report (no clubId).',
    operationId: 'clubs_downloadGlobalAnnualReport',
  })
  @ApiProduces('application/pdf')
  @ApiOkResponse({
    description: 'Global annual report PDF',
    content: {
      'application/pdf': {
        schema: { type: 'string', format: 'binary' },
      },
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
            code: { example: ERROR.UNAUTHORIZED },
            message: { example: 'Unauthorized' },
          },
        },
      ],
    },
  })
  @ApiForbiddenResponse({
    description: 'Only admins can generate global reports',
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
  @ApiNotFoundResponse({
    description: 'Report not found',
    schema: {
      allOf: [
        { $ref: getSchemaPath(ApiResponseDto) },
        {
          properties: {
            code: { example: ERROR.NOT_FOUND },
            message: { example: 'Report not found' },
          },
        },
      ],
    },
  })
  async getGlobalAnnualReport(
    @CurrentUser() user: { id: string; role: UserRole },
    @Query() dto: GenerateAnnualReportDto,
    @Res({ passthrough: true }) res: Response,
  ): Promise<StreamableFile> {
    const result = await this.clubs.getAnnualReport(
      user.id,
      user.role,
      null,
      dto?.year,
    );

    res.set({
      'Content-Type': result.contentType,
      'Content-Disposition': `attachment; filename="${result.filename}"`,
    });

    return new StreamableFile(result.pdfBuffer);
  }

  // GET /clubs/:id/reports
  // Generates a new annual report PDF, stores it, and records metadata.
  @Get(':id/reports')
  @ApiBearerAuth()
  @Roles(UserRole.CLUB)
  @ApiParam({
    name: 'id',
    description: 'Club UUID',
    required: true,
  })
  @ApiOperation({
    summary: 'Generate club annual report',
    description: 'Clubs can generate their own report.',
    operationId: 'clubs_downloadAnnualReport',
  })
  @ApiProduces('application/pdf')
  @ApiOkResponse({
    description: 'Annual report PDF',
    content: {
      'application/pdf': {
        schema: { type: 'string', format: 'binary' },
      },
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
            code: { example: ERROR.UNAUTHORIZED },
            message: { example: 'Unauthorized' },
          },
        },
      ],
    },
  })
  @ApiForbiddenResponse({
    description: 'Access denied for this report',
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
  @ApiNotFoundResponse({
    description: 'Club or report not found',
    schema: {
      allOf: [
        { $ref: getSchemaPath(ApiResponseDto) },
        {
          properties: {
            code: { example: ERROR.NOT_FOUND },
            message: { example: 'Club not found' },
          },
        },
      ],
    },
  })
  async getAnnualReport(
    @Param('id') clubId: string,
    @CurrentUser() user: { id: string; role: UserRole },
    @Query() dto: GenerateAnnualReportDto,
    @Res({ passthrough: true }) res: Response,
  ): Promise<StreamableFile> {
    const result = await this.clubs.getAnnualReport(
      user.id,
      user.role,
      clubId,
      dto?.year,
    );

    res.set({
      'Content-Type': result.contentType,
      'Content-Disposition': `attachment; filename="${result.filename}"`,
    });

    return new StreamableFile(result.pdfBuffer);
  }

  // GET /clubs/:id - public profile header (anonymous/student/admin variants)
  @Public()
  @UseGuards(OptionalJwtAuthGuard)
  @Get(':id')
  @ApiParam({
    name: 'id',
    description: 'Club UUID',
    required: true,
  })
  @ApiOperation({
    summary: 'Get club public header / stats',
    description:
      'Anonymous users see public info. Students also get isFollowed. Admins may view inactive clubs and get isActive.',
    operationId: 'clubs_getHeader',
  })
  @ApiOkResponse({
    description: 'Club header loaded',
    schema: {
      allOf: [
        { $ref: getSchemaPath(ApiResponseDto) },
        {
          properties: {
            data: { $ref: getSchemaPath(ClubPublicHeaderResponseDto) },
            code: { example: 'OK' },
            message: { example: 'Club header loaded' },
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
    description: 'Club not found',
    schema: {
      allOf: [
        { $ref: getSchemaPath(ApiResponseDto) },
        {
          properties: {
            code: { example: ERROR.NOT_FOUND },
            message: { example: 'Club not found' },
          },
        },
      ],
    },
  })
  async getClubHeader(
    @Param('id') clubId: string,
    @Req() req: Request,
  ): Promise<ClubPublicHeaderResponseDto> {
    const maybeUser = (req as any).user as
      | { id: string; role: UserRole }
      | undefined;

    const isAdmin = maybeUser?.role === UserRole.ADMIN;
    const isStudent = maybeUser?.role === UserRole.STUDENT;
    const userId = isStudent ? maybeUser?.id : undefined;

    const result = await this.clubs.getClubHeader(clubId, {
      userId,
      isAdmin,
      isStudent,
    });

    return result;
  }

  // GET /clubs/:id/leaders – admin-only visibility into leaders
  @Get(':id/leaders')
  @ApiBearerAuth()
  @Roles(UserRole.ADMIN)
  @ApiParam({
    name: 'id',
    description: 'Club UUID',
    required: true,
  })
  @ApiOperation({
    summary: 'Get leaders for a club (Admin)',
    description: 'Admin-only. Returns contact info of the club leadership.',
    operationId: 'clubs_getLeaders',
  })
  @ApiOkResponse({
    description: 'Club leaders returned',
    schema: {
      allOf: [
        { $ref: getSchemaPath(ApiResponseDto) },
        {
          properties: {
            data: { $ref: getSchemaPath(ClubLeadersResponseDto) },
            code: { example: 'OK' },
            message: { example: 'Club leaders returned' },
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
            code: { example: ERROR.UNAUTHORIZED },
            message: { example: 'Unauthorized' },
          },
        },
      ],
    },
  })
  @ApiForbiddenResponse({
    description: 'Only admins can access leaders for arbitrary clubs',
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
  @ApiNotFoundResponse({
    description: 'Club not found',
    schema: {
      allOf: [
        { $ref: getSchemaPath(ApiResponseDto) },
        {
          properties: {
            code: { example: ERROR.NOT_FOUND },
            message: { example: 'Club not found' },
          },
        },
      ],
    },
  })
  async getClubLeaders(
    @Param('id') clubId: string,
  ): Promise<ClubLeadersResponseDto> {
    const result = await this.clubs.getClubLeaders(clubId);
    return result;
  }

  // POST /clubs/:id/subscribe – student follows a club
  @HttpCode(200)
  @Post(':id/subscribe')
  @ApiBearerAuth()
  @Roles(UserRole.STUDENT)
  @ApiParam({
    name: 'id',
    description: 'Club UUID to follow',
    required: true,
  })
  @ApiOperation({
    summary: 'Follow a club',
    description:
      'Idempotent. If already following, still returns isFollowed=true.',
    operationId: 'clubs_follow',
  })
  @ApiOkResponse({
    description: 'Club followed / already followed',
    schema: {
      allOf: [
        { $ref: getSchemaPath(ApiResponseDto) },
        {
          properties: {
            data: { $ref: getSchemaPath(SubscribeClubResponseDto) },
            code: { example: 'OK' },
            message: { example: 'Club followed' },
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
            code: { example: ERROR.UNAUTHORIZED },
            message: { example: 'Unauthorized' },
          },
        },
      ],
    },
  })
  @ApiForbiddenResponse({
    description: 'Only students can follow clubs',
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
  @ApiNotFoundResponse({
    description: 'Club not found',
    schema: {
      allOf: [
        { $ref: getSchemaPath(ApiResponseDto) },
        {
          properties: {
            code: { example: ERROR.NOT_FOUND },
            message: { example: 'Club not found' },
          },
        },
      ],
    },
  })
  async followClub(
    @Param('id') clubId: string,
    @CurrentUser() user: { id: string },
  ): Promise<SubscribeClubResponseDto> {
    const result = await this.clubs.followClub(user.id, clubId);
    return result;
  }

  // DELETE /clubs/:id/subscribe – student unfollows a club
  @Delete(':id/subscribe')
  @ApiBearerAuth()
  @Roles(UserRole.STUDENT)
  @HttpCode(HttpStatus.OK)
  @ApiParam({
    name: 'id',
    description: 'Club UUID to unfollow',
    required: true,
  })
  @ApiOperation({
    summary: 'Unfollow a club',
    description:
      'Idempotent. If you were not following, returns isFollowed=false anyway.',
    operationId: 'clubs_unfollow',
  })
  @ApiOkResponse({
    description: 'Club unfollowed / already not followed',
    schema: {
      allOf: [
        { $ref: getSchemaPath(ApiResponseDto) },
        {
          properties: {
            data: { $ref: getSchemaPath(SubscribeClubResponseDto) },
            code: { example: 'OK' },
            message: { example: 'Club unfollowed' },
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
            code: { example: ERROR.UNAUTHORIZED },
            message: { example: 'Unauthorized' },
          },
        },
      ],
    },
  })
  @ApiForbiddenResponse({
    description: 'Only students can unfollow clubs',
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
  @ApiNotFoundResponse({
    description: 'Club not found',
    schema: {
      allOf: [
        { $ref: getSchemaPath(ApiResponseDto) },
        {
          properties: {
            code: { example: ERROR.NOT_FOUND },
            message: { example: 'Club not found' },
          },
        },
      ],
    },
  })
  async unfollowClub(
    @Param('id') clubId: string,
    @CurrentUser() user: { id: string },
  ): Promise<SubscribeClubResponseDto> {
    const result = await this.clubs.unfollowClub(user.id, clubId);
    return result;
  }

  // PATCH /clubs/:id/name – admin can rename a club
  @Patch(':id/name')
  @ApiBearerAuth()
  @Roles(UserRole.ADMIN)
  @ApiParam({
    name: 'id',
    description: 'Club UUID to rename',
    required: true,
  })
  @ApiOperation({
    summary: 'Rename a club (Admin only)',
    description:
      'Updates the club display name. This will be visible everywhere.',
    operationId: 'clubs_rename',
  })
  @ApiOkResponse({
    description: 'Club renamed successfully',
    schema: {
      allOf: [
        { $ref: getSchemaPath(ApiResponseDto) },
        {
          properties: {
            data: { $ref: getSchemaPath(AdminRenameClubResponseDto) },
            code: { example: 'OK' },
            message: { example: 'Club renamed' },
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
            code: { example: ERROR.UNAUTHORIZED },
            message: { example: 'Unauthorized' },
          },
        },
      ],
    },
  })
  @ApiForbiddenResponse({
    description: 'Only admins can rename clubs',
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
  @ApiNotFoundResponse({
    description: 'Club not found',
    schema: {
      allOf: [
        { $ref: getSchemaPath(ApiResponseDto) },
        {
          properties: {
            code: { example: ERROR.NOT_FOUND },
            message: { example: 'Club not found' },
          },
        },
      ],
    },
  })
  async renameClub(
    @Param('id') clubId: string,
    @CurrentUser() user: { id: string },
    @Body() dto: AdminRenameClubDto,
  ): Promise<AdminRenameClubResponseDto> {
    const result = await this.clubs.renameClub(user.id, clubId, dto.name);
    return result;
  }
}
