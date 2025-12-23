import {
  Injectable,
  Logger,
  BadRequestException,
  ForbiddenException,
  NotFoundException,
  ConflictException,
} from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { EntityManager, Repository } from 'typeorm';
import { ERROR } from 'src/common/constants/error-codes';
import { UserRole } from 'src/common/enums/user-role.enum';

import { AnnexTemplate } from '../entities/annex-template.entity';
import { AnnexUpload } from '../entities/annex-upload.entity';
import { RequestStatus } from '../../events/entities/enums/request-status.enum';

import {
  CreateAnnexTemplateDto,
  UpdateAnnexTemplateDto,
  ValidateAnnexDto,
} from '../dto/requests';
import { AnnexTemplateViewDto } from '../dto/responses';
import { AnnexViewDto } from '../../../common/dto/annex-view.dto';
import { StorageService } from '../../storage/storage.service';

@Injectable()
export class AnnexesService {
  private readonly logger = new Logger(AnnexesService.name);

  constructor(
    @InjectRepository(AnnexTemplate)
    private readonly templates: Repository<AnnexTemplate>,
    @InjectRepository(AnnexUpload)
    private readonly uploads: Repository<AnnexUpload>,
    private readonly storage: StorageService,
  ) {}

  // ─────────────────────────────────────────────────────
  // SHARED
  // ─────────────────────────────────────────────────────
  async listActiveTemplates(): Promise<AnnexTemplateViewDto[]> {
    const rows = await this.templates.find({
      where: { isArchived: false },
      order: { annexNumber: 'ASC' },
    });

    return rows.map((t) => ({
      id: t.id,
      annexNumber: t.annexNumber,
      title: t.title,
      pdfTemplateUrl: t.templateKey,
      required: t.required,
      isArchived: t.isArchived,
    }));
  }

  /**
   * Single source of truth for "which annexes are required right now".
   * Used by:
   * - Zone 3 (create request) – to enforce presence
   * - Zone 3 (approve) – via assertAllAnnexesValidatedForRequest
   */
  async getActiveRequiredTemplateIds(
    manager?: EntityManager,
  ): Promise<string[]> {
    const repo = manager
      ? manager.getRepository(AnnexTemplate)
      : this.templates;
    const rows = await repo
      .createQueryBuilder('t')
      .where('t.required = true')
      .andWhere('t.is_archived = false')
      .select(['t.id AS id'])
      .orderBy('t.annex_number', 'ASC')
      .getRawMany<{ id: string }>();

    return rows.map((r) => r.id);
  }

  // ─────────────────────────────────────────────────────
  // ADMIN: TEMPLATES
  // ─────────────────────────────────────────────────────
  async adminCreateTemplate(
    adminRole: UserRole,
    dto: CreateAnnexTemplateDto,
  ): Promise<AnnexTemplateViewDto> {
    if (adminRole !== UserRole.ADMIN) {
      throw new ForbiddenException(ERROR.FORBIDDEN);
    }

    const exists = await this.templates.exists({
      where: { annexNumber: dto.annexNumber },
    });
    if (exists) {
      throw new BadRequestException({
        code: ERROR.VALIDATION_ERROR,
        message: 'annexNumber must be unique.',
      });
    }

    const entity = this.templates.create({
      annexNumber: dto.annexNumber,
      title: dto.title.trim(),
      templateKey: dto.pdfTemplateUrl,
      required: dto.required,
      isArchived: false,
    });

    const saved = await this.templates.save(entity);

    this.logger.log(
      `[adminCreateTemplate] annex=${saved.id} number=${saved.annexNumber} title="${saved.title}"`,
    );

    return {
      id: saved.id,
      annexNumber: saved.annexNumber,
      title: saved.title,
      pdfTemplateUrl: saved.templateKey,
      required: saved.required,
      isArchived: saved.isArchived,
    };
  }

  async adminUpdateTemplate(
    adminRole: UserRole,
    id: string,
    dto: UpdateAnnexTemplateDto,
  ): Promise<AnnexTemplateViewDto> {
    if (adminRole !== UserRole.ADMIN) {
      throw new ForbiddenException(ERROR.FORBIDDEN);
    }

    const tpl = await this.templates.findOne({ where: { id } });
    if (!tpl) {
      throw new NotFoundException({
        code: ERROR.NOT_FOUND,
        message: 'Annex template not found.',
      });
    }

    if (dto.annexNumber && dto.annexNumber !== tpl.annexNumber) {
      const clash = await this.templates.exists({
        where: { annexNumber: dto.annexNumber },
      });
      if (clash) {
        throw new BadRequestException({
          code: ERROR.VALIDATION_ERROR,
          message: 'annexNumber must be unique.',
        });
      }
      tpl.annexNumber = dto.annexNumber;
    }

    if (dto.title !== undefined) {
      tpl.title = dto.title.trim();
    }

    if (dto.pdfTemplateUrl !== undefined) {
      tpl.templateKey = dto.pdfTemplateUrl;
    }

    if (dto.required !== undefined) {
      tpl.required = dto.required;
    }

    if (dto.isArchived !== undefined) {
      tpl.isArchived = dto.isArchived;
    }

    const saved = await this.templates.save(tpl);

    this.logger.log(
      `[adminUpdateTemplate] annex=${saved.id} archived=${saved.isArchived}`,
    );

    return {
      id: saved.id,
      annexNumber: saved.annexNumber,
      title: saved.title,
      pdfTemplateUrl: saved.templateKey,
      required: saved.required,
      isArchived: saved.isArchived,
    };
  }

  // ─────────────────────────────────────────────────────
  // CLUB UPLOAD (DISABLED – must upload at creation time)
  // ─────────────────────────────────────────────────────
  async clubUploadAnnexForRequest(): Promise<AnnexViewDto> {
    throw new ConflictException({
      code: ERROR.CONFLICT,
      message: 'Annexes can only be uploaded when creating the event request.',
    });
  }

  // ─────────────────────────────────────────────────────
  // ADMIN: VALIDATE / UNVALIDATE
  // ─────────────────────────────────────────────────────
  async adminValidateAnnexForRequest(
    adminRole: UserRole,
    requestId: string,
    templateId: string,
    dto: ValidateAnnexDto,
  ): Promise<AnnexViewDto> {
    if (adminRole !== UserRole.ADMIN) {
      throw new ForbiddenException(ERROR.FORBIDDEN);
    }

    const upload = await this.uploads.findOne({
      where: {
        eventRequestId: requestId,
        annexTemplateId: templateId,
      },
      relations: ['template', 'eventRequest'],
    });

    if (!upload) {
      throw new NotFoundException({
        code: ERROR.NOT_FOUND,
        message: 'Annex upload not found for this request/template.',
      });
    }

    // once request is no longer PENDING, you cannot touch annex validation
    if (upload.eventRequest.status !== RequestStatus.PENDING) {
      throw new ConflictException({
        code: ERROR.CONFLICT,
        message: 'Cannot change annex validation for a non-pending request.',
      });
    }

    upload.validated = dto.validated;
    await this.uploads.save(upload);

    const signed = await this.storage.signAnnex(
      upload.uploadKey,
      UserRole.ADMIN,
    );

    this.logger.log(
      `[adminValidateAnnexForRequest] request=${requestId} template=${templateId} validated=${dto.validated}`,
    );

    return {
      annexTemplateId: upload.annexTemplateId,
      title: upload.template?.title ?? '',
      annexUrl: signed,
      validated: upload.validated,
    };
  }

  // ─────────────────────────────────────────────────────
  // USED BY ZONE 3 (APPROVE STEP)
  // ─────────────────────────────────────────────────────
  async assertAllAnnexesValidatedForRequest(
    requestId: string,
    manager?: EntityManager,
  ): Promise<void> {
    const repoUp = manager ? manager.getRepository(AnnexUpload) : this.uploads;

    // 1) single source of truth
    const required = await this.getActiveRequiredTemplateIds(manager);
    if (!required.length) {
      return;
    }

    // 2) get all uploads for this request
    const uploads = await repoUp
      .createQueryBuilder('u')
      .where('u.event_request_id = :reqId', { reqId: requestId })
      .select([
        'u.annex_template_id AS "annexTemplateId"',
        'u.validated AS validated',
      ])
      .getRawMany<{ annexTemplateId: string; validated: boolean }>();

    const uploadMap = new Map<string, { validated: boolean }>();
    for (const u of uploads) {
      uploadMap.set(u.annexTemplateId, { validated: u.validated });
    }

    const missing: string[] = [];
    const unvalidated: string[] = [];

    for (const templateId of required) {
      const up = uploadMap.get(templateId);
      if (!up) {
        missing.push(templateId);
        continue;
      }
      if (!up.validated) {
        unvalidated.push(templateId);
      }
    }

    if (missing.length || unvalidated.length) {
      throw new ConflictException({
        code: ERROR.CONFLICT,
        message: 'Cannot approve: annexes are missing or not validated.',
        error: {
          missingTemplateIds: missing,
          unvalidatedTemplateIds: unvalidated,
        },
      });
    }
  }
}
