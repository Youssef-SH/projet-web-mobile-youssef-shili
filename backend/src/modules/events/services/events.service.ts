import {
  Injectable,
  BadRequestException,
  ForbiddenException,
  NotFoundException,
  ConflictException,
  Logger,
} from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository, DataSource, QueryRunner, MoreThanOrEqual } from 'typeorm';

import { ERROR } from 'src/common/constants/error-codes';

import { EventRequest } from '../entities/event-request.entity';
import { Event } from '../entities/event.entity';
import { Room } from '../entities/room.entity';

import { Club } from 'src/modules/clubs/entities/club.entity';
import { ClubLeader } from 'src/modules/clubs/entities/club-leader.entity';

import { AnnexTemplate } from 'src/modules/annexes/entities/annex-template.entity';
import { AnnexUpload } from 'src/modules/annexes/entities/annex-upload.entity';

import {
  CreateEventRequestDto,
  AdminEventRequestsQueryDto,
  ClubEventRequestsQueryDto,
  ApproveEventRequestDto,
  RejectEventRequestDto,
  RescheduleEventDto,
  ChangeEventRoomDto,
  CreateRoomDto,
} from '../dto/requests';

import {
  CreateEventRequestResponseDto,
  AdminEventRequestListItemResponseDto,
  ClubEventRequestListItemResponseDto,
  AdminEventRequestDetailResponseDto,
  ClubEventRequestDetailResponseDto,
  EventRequestApproveResponseDto,
  EventRequestRejectResponseDto,
  PublicEventDetailResponseDto,
  PublicEventListItemResponseDto,
  EventRescheduleResponseDto,
  EventRoomChangeResponseDto,
  EventCancelResponseDto,
  RoomResponseDto,
  RoomCreateResponseDto,
} from '../dto/responses';

import { PaginatedResponseDto } from 'src/common/dto/paginated-response.dto';
import { RequestStatus } from '../entities/enums/request-status.enum';
import { ClubRole } from 'src/common/enums/club-role.enum';
import { EventType } from '../entities/enums/event-type.enum';
import { StorageService } from 'src/modules/storage/storage.service';
import { UserRole } from 'src/common/enums/user-role.enum';
import { AnnexesService } from 'src/modules/annexes/services/annexes.service';

const CALENDAR_WINDOW_DAYS = 30;

@Injectable()
export class EventsService {
  private readonly logger = new Logger(EventsService.name);

  constructor(
    @InjectRepository(EventRequest)
    private readonly requests: Repository<EventRequest>,
    @InjectRepository(Event)
    private readonly events: Repository<Event>,
    @InjectRepository(Room)
    private readonly rooms: Repository<Room>,
    @InjectRepository(Club)
    private readonly clubs: Repository<Club>,
    @InjectRepository(ClubLeader)
    private readonly leaders: Repository<ClubLeader>,
    @InjectRepository(AnnexTemplate)
    private readonly annexTemplates: Repository<AnnexTemplate>,
    @InjectRepository(AnnexUpload)
    private readonly annexUploads: Repository<AnnexUpload>,
    private readonly annexesService: AnnexesService,
    private readonly storage: StorageService,
    private readonly dataSource: DataSource,
  ) {}

  // ---------------------------------------------------------------------------
  // Helpers
  // ---------------------------------------------------------------------------

  private nowUtc(): Date {
    return new Date(Date.now());
  }

  private async findClubByUserIdOrThrow(userId: string): Promise<Club> {
    const club = await this.clubs.findOne({ where: { userId } });
    if (!club) {
      throw new NotFoundException({
        code: ERROR.NOT_FOUND,
        message: 'Club not found.',
      });
    }
    return club;
  }

  private async assertLeaderOfClubOrThrow(
    clubId: string,
    leaderId: string,
  ): Promise<ClubLeader> {
    const leader = await this.leaders.findOne({
      where: { id: leaderId, clubId },
    });
    if (!leader) {
      throw new ForbiddenException({
        code: ERROR.FORBIDDEN,
        message: 'SubmittedBy must be a leader of the club.',
      });
    }

    if (
      leader.role !== ClubRole.PRESIDENT &&
      leader.role !== ClubRole.VICE_PRESIDENT
    ) {
      throw new ForbiddenException({
        code: ERROR.FORBIDDEN,
        message: 'Only President or VicePresident can submit event requests.',
      });
    }

    return leader;
  }

  private validateEventTimingAndLocation(dto: {
    startTime: string;
    endTime: string;
    roomId?: string;
    externalAddress?: string;
  }): void {
    const start = new Date(dto.startTime);
    const end = new Date(dto.endTime);
    if (!(start instanceof Date) || isNaN(start.getTime())) {
      throw new BadRequestException({
        code: ERROR.VALIDATION_ERROR,
        message: 'Invalid startTime.',
      });
    }
    if (!(end instanceof Date) || isNaN(end.getTime())) {
      throw new BadRequestException({
        code: ERROR.VALIDATION_ERROR,
        message: 'Invalid endTime.',
      });
    }
    if (end.getTime() <= start.getTime()) {
      throw new BadRequestException({
        code: ERROR.VALIDATION_ERROR,
        message: 'endTime must be greater than startTime.',
      });
    }

    const now = this.nowUtc();
    const diffMs = start.getTime() - now.getTime();
    const diffDays = diffMs / (1000 * 60 * 60 * 24);
    if (diffDays < 7) {
      throw new BadRequestException({
        code: ERROR.VALIDATION_ERROR,
        message: 'Event requests must be submitted at least 7 days in advance.',
      });
    }

    const hasRoom = !!dto.roomId;
    const hasExternal = !!dto.externalAddress;
    if ((hasRoom && hasExternal) || (!hasRoom && !hasExternal)) {
      throw new BadRequestException({
        code: ERROR.VALIDATION_ERROR,
        message: 'Provide exactly one of roomId or externalAddress.',
      });
    }
  }

  private renderLocation(
    roomName: string | null,
    external: string | null,
  ): string {
    if (roomName) return roomName;
    if (external) return external;
    return '—';
  }

  private async loadRequiredAnnexTemplateIds(): Promise<string[]> {
    const rows = await this.annexTemplates
      .createQueryBuilder('t')
      .where('t.required = true')
      .andWhere('t.is_archived = false')
      .select(['t.id AS id'])
      .getRawMany<{ id: string }>();

    return rows.map((r) => r.id);
  }

  private async assertRoomExistsOrThrow(
    roomId: string,
    manager?: QueryRunner['manager'],
  ): Promise<Room> {
    const repo = manager ? manager.getRepository(Room) : this.rooms;
    const room = await repo.findOne({ where: { id: roomId } });
    if (!room) {
      throw new ConflictException({
        code: ERROR.CONFLICT,
        message: 'Room no longer exists.',
      });
    }
    return room;
  }

  // overlap = (startA < endB) && (endA > startB)
  private async assertRoomFreeOrThrow(
    roomId: string,
    start: Date,
    end: Date,
    ignoreEventId?: string,
    manager?: QueryRunner['manager'],
  ): Promise<void> {
    const repo = manager ? manager.getRepository(Event) : this.events;

    const qb = repo
      .createQueryBuilder('e')
      .where('e.room_id = :roomId', { roomId })
      .andWhere('e.is_cancelled = false')
      .andWhere('e.start_time < :end', { end })
      .andWhere('e.end_time > :start', { start });

    if (ignoreEventId) {
      qb.andWhere('e.id != :ignoreEventId', { ignoreEventId });
    }

    const count = await qb.getCount();
    if (count > 0) {
      throw new ConflictException({
        code: ERROR.CONFLICT,
        message: 'Room is already booked for that time range.',
      });
    }
  }

  // ---------------------------------------------------------------------------
  // 1. POST /events/requests  (multipart)
  // ---------------------------------------------------------------------------
  async createEventRequestWithAnnexes(
    clubUserId: string,
    dto: CreateEventRequestDto,
    files: Express.Multer.File[],
  ): Promise<CreateEventRequestResponseDto> {
    const club = await this.findClubByUserIdOrThrow(clubUserId);
    const leader = await this.assertLeaderOfClubOrThrow(
      club.id,
      dto.submittedBy,
    );

    // business rules
    this.validateEventTimingAndLocation(dto);

    // If internal, room must exist
    if (dto.roomId) {
      const roomExists = await this.rooms.exist({ where: { id: dto.roomId } });
      if (!roomExists) {
        throw new BadRequestException({
          code: ERROR.VALIDATION_ERROR,
          message: 'Selected room does not exist.',
        });
      }
    }

    // Required annex templates
    const requiredTemplateIds = await this.loadRequiredAnnexTemplateIds();

    // Map incoming files: fieldname must be annex_<templateId>
    const fileMap = new Map<string, Express.Multer.File>();
    for (const f of files ?? []) {
      const m = /^annex_([0-9a-f-]{36})$/i.exec(f.fieldname);
      if (m) {
        fileMap.set(m[1], f);
      }
    }

    const missing: string[] = [];
    for (const templateId of requiredTemplateIds) {
      if (!fileMap.has(templateId)) missing.push(templateId);
    }

    if (missing.length) {
      throw new BadRequestException({
        code: ERROR.VALIDATION_ERROR,
        message: 'Missing required annexes.',
        error: { missingTemplateIds: missing },
      });
    }

    // Transaction
    const queryRunner: QueryRunner = this.dataSource.createQueryRunner();
    await queryRunner.connect();
    await queryRunner.startTransaction();

    const uploadedKeys: string[] = [];

    try {
      const request = this.requests.create({
        clubId: club.id,
        submittedByLeaderId: leader.id,
        roomId: dto.roomId ?? null,
        externalAddress: dto.externalAddress ?? null,
        title: dto.title.trim(),
        description: dto.description?.trim() ?? null,
        eventType: dto.eventType,
        startTime: new Date(dto.startTime),
        endTime: new Date(dto.endTime),
        expectedStudents: dto.expectedStudents ?? null,
        status: RequestStatus.PENDING,
      });

      const savedReq = await queryRunner.manager.save(EventRequest, request);

      for (const templateId of requiredTemplateIds) {
        const file = fileMap.get(templateId)!;

        const objectKey = await this.storage.uploadAnnex(
          savedReq.id,
          templateId,
          file,
          UserRole.CLUB,
        );

        uploadedKeys.push(objectKey);

        const upload = this.annexUploads.create({
          eventRequestId: savedReq.id,
          annexTemplateId: templateId,
          uploadKey: objectKey,
          validated: false,
        });

        await queryRunner.manager.save(AnnexUpload, upload);
      }

      await queryRunner.commitTransaction();

      this.logger.log(
        `[createEventRequestWithAnnexes] club=${club.id} request=${request.id} annexes=${requiredTemplateIds.length}`,
      );

      return {
        id: request.id,
        status: request.status,
      };
    } catch (err: any) {
      await queryRunner.rollbackTransaction();

      if (uploadedKeys.length) {
        try {
          await this.storage.deleteRawObject(uploadedKeys);
          this.logger.warn(
            `[createEventRequestWithAnnexes] cleaned up ${uploadedKeys.length} annex uploads after failure`,
          );
        } catch (cleanupErr: any) {
          this.logger.error(
            `[createEventRequestWithAnnexes] cleanup failed: ${cleanupErr.message}`,
          );
        }
      }

      if (
        typeof err?.message === 'string' &&
        err.message.toLowerCase().includes('unique')
      ) {
        throw new ConflictException({
          code: ERROR.CONFLICT,
          message: 'Duplicate event request.',
        });
      }

      throw err;
    } finally {
      await queryRunner.release();
    }
  }

  // ---------------------------------------------------------------------------
  // 2. GET /events/requests  (admin)
  // ---------------------------------------------------------------------------
  async adminListEventRequests(
    query: AdminEventRequestsQueryDto,
  ): Promise<PaginatedResponseDto<AdminEventRequestListItemResponseDto>> {
    const page = query.page ?? 1;
    const limit = Math.min(query.limit ?? 10, 20);
    const offset = (page - 1) * limit;

    // 1) base qb for data
    const dataQb = this.requests
      .createQueryBuilder('r')
      .innerJoin(Club, 'c', 'c.id = r.club_id')
      .leftJoin(ClubLeader, 'l', 'l.id = r.submitted_by_leader_id')
      .select([
        'r.id AS id',
        'r.title AS title',
        'r.event_type AS "eventType"',
        'c.name AS "clubName"',
        'r.status AS status',
        'r.start_time AS "startTime"',
        'r.end_time AS "endTime"',
        'r.submitted_at AS "submittedAt"',
        'l.role AS "submittedByRole"',
      ])
      .orderBy('r.submitted_at', 'DESC')
      .offset(offset)
      .limit(limit);

    // apply filters on BOTH dataQb + countQb
    if (query.status) {
      dataQb.andWhere('r.status = :status', { status: query.status });
    }
    if (query.clubId) {
      dataQb.andWhere('r.club_id = :clubId', { clubId: query.clubId });
    }

    // 2) separate count qb (NO select/limit/offset)
    const countQb = this.requests.createQueryBuilder('r');

    if (query.status) {
      countQb.andWhere('r.status = :status', { status: query.status });
    }
    if (query.clubId) {
      countQb.andWhere('r.club_id = :clubId', { clubId: query.clubId });
    }

    const [rows, total] = await Promise.all([
      dataQb.getRawMany<{
        id: string;
        title: string;
        eventType: EventType;
        clubName: string;
        status: RequestStatus;
        startTime: Date;
        endTime: Date;
        submittedAt: Date;
        submittedByRole: ClubRole | null;
      }>(),
      countQb.getCount(),
    ]);

    return {
      total,
      page,
      limit,
      totalPages: Math.ceil(total / limit),
      data: rows.map((r) => ({
        id: r.id,
        title: r.title,
        eventType: r.eventType,
        clubName: r.clubName,
        status: r.status,
        startTime: r.startTime.toISOString(),
        endTime: r.endTime.toISOString(),
        submittedAt: r.submittedAt.toISOString(),
        submittedByRole: r.submittedByRole ?? ClubRole.PRESIDENT,
      })),
    };
  }

  // ---------------------------------------------------------------------------
  // 3. GET /events/requests/me  (club)
  // ---------------------------------------------------------------------------
  async clubListOwnEventRequests(
    clubUserId: string,
    query: ClubEventRequestsQueryDto,
  ): Promise<PaginatedResponseDto<ClubEventRequestListItemResponseDto>> {
    const club = await this.findClubByUserIdOrThrow(clubUserId);

    const page = query.page ?? 1;
    // you chose B → 20
    const limit = Math.min(query.limit ?? 20, 20);
    const offset = (page - 1) * limit;

    const dataQb = this.requests
      .createQueryBuilder('r')
      .leftJoin(Room, 'rm', 'rm.id = r.room_id')
      .select([
        'r.id AS id',
        'r.title AS title',
        'r.status AS status',
        'r.start_time AS "startTime"',
        'r.end_time AS "endTime"',
        'rm.name AS "roomName"',
        'r.external_address AS "externalAddress"',
      ])
      .where('r.club_id = :clubId', { clubId: club.id })
      .orderBy('r.submitted_at', 'DESC')
      .offset(offset)
      .limit(limit);

    const countQb = this.requests
      .createQueryBuilder('r')
      .where('r.club_id = :clubId', { clubId: club.id });

    const [rows, total] = await Promise.all([
      dataQb.getRawMany<{
        id: string;
        title: string;
        status: RequestStatus;
        startTime: Date;
        endTime: Date;
        roomName: string | null;
        externalAddress: string | null;
      }>(),
      countQb.getCount(),
    ]);

    return {
      total,
      page,
      limit,
      totalPages: Math.ceil(total / limit),
      data: rows.map((r) => ({
        id: r.id,
        title: r.title,
        status: r.status,
        startTime: r.startTime.toISOString(),
        endTime: r.endTime.toISOString(),
        location: this.renderLocation(r.roomName, r.externalAddress),
      })),
    };
  }

  // ---------------------------------------------------------------------------
  // 4. GET /events/requests/:id   (admin view)
  // ---------------------------------------------------------------------------
  async getEventRequestForAdmin(
    requestId: string,
  ): Promise<AdminEventRequestDetailResponseDto> {
    const req = await this.requests.findOne({
      where: { id: requestId },
      relations: [
        'room',
        'submittedByLeader',
        'annexes',
        'annexes.template',
        'club',
      ],
    });

    if (!req) {
      throw new NotFoundException({
        code: ERROR.NOT_FOUND,
        message: 'Event request not found.',
      });
    }

    return {
      id: req.id,
      clubId: req.clubId,
      submittedBy: req.submittedByLeader
        ? {
            role: req.submittedByLeader.role,
            fullName: req.submittedByLeader.fullName,
            email: req.submittedByLeader.email ?? '',
            phone: req.submittedByLeader.phone ?? '',
            cin: req.submittedByLeader.cin ?? '',
            studyLevel: req.submittedByLeader.studyLevel ?? '',
            specialization: req.submittedByLeader.specialization ?? '',
          }
        : {
            role: ClubRole.PRESIDENT,
            fullName: '',
            email: '',
            phone: '',
            cin: '',
            studyLevel: '',
            specialization: '',
          },
      title: req.title,
      description: req.description ?? '',
      eventType: req.eventType,
      startTime: req.startTime.toISOString(),
      endTime: req.endTime.toISOString(),
      expectedStudents: req.expectedStudents ?? 0,
      roomId: req.roomId ?? null,
      externalAddress: req.externalAddress ?? null,
      status: req.status,
      adminComment: req.adminComment ?? null,
      submittedAt: req.submittedAt.toISOString(),

      annexes: await Promise.all(
        (req.annexes ?? []).map(async (a) => {
          const signed = await this.storage.signAnnex(
            a.uploadKey,
            UserRole.ADMIN,
          );
          if (!signed) {
            this.logger.warn(
              `[getEventRequestForAdmin] cannot sign annex=${a.uploadKey} req=${req.id}`,
            );
          }
          return {
            annexTemplateId: a.annexTemplateId,
            title: a.template?.title ?? '',
            annexUrl: signed,
            validated: a.validated,
          };
        }),
      ),
    };
  }

  async getEventRequestForClub(
    clubUserId: string,
    requestId: string,
  ): Promise<ClubEventRequestDetailResponseDto> {
    const club = await this.findClubByUserIdOrThrow(clubUserId);

    const req = await this.requests.findOne({
      where: { id: requestId, clubId: club.id },
      relations: ['room', 'submittedByLeader'],
    });

    if (!req) {
      throw new NotFoundException({
        code: ERROR.NOT_FOUND,
        message: 'Event request not found.',
      });
    }

    return {
      id: req.id,
      title: req.title,
      description: req.description ?? '',
      eventType: req.eventType,
      startTime: req.startTime.toISOString(),
      endTime: req.endTime.toISOString(),
      roomId: req.roomId ?? null,
      externalAddress: req.externalAddress ?? null,
      status: req.status,
      adminComment: req.adminComment ?? null,
      submittedBy: {
        role: req.submittedByLeader?.role ?? ClubRole.PRESIDENT,
      },
      submittedAt: req.submittedAt.toISOString(),
    };
  }

  // ---------------------------------------------------------------------------
  // 5. POST /events/requests/:id/approve
  // ---------------------------------------------------------------------------
  async approveEventRequest(
    adminId: string,
    requestId: string,
    dto: ApproveEventRequestDto,
  ): Promise<EventRequestApproveResponseDto> {
    const queryRunner = this.dataSource.createQueryRunner();
    await queryRunner.connect();
    await queryRunner.startTransaction();

    try {
      const manager = queryRunner.manager;

      const req = await manager.findOne(EventRequest, {
        where: { id: requestId },
        relations: ['room', 'club', 'event'],
      });

      if (!req) {
        throw new NotFoundException({
          code: ERROR.NOT_FOUND,
          message: 'Event request not found.',
        });
      }

      // disallow approving past events
      const now = new Date();
      if (req.startTime.getTime() < now.getTime()) {
        throw new ConflictException({
          code: ERROR.CONFLICT,
          message:
            'Cannot approve an event whose startTime is in the past. Ask the club to resubmit.',
        });
      }

      // re-validate location on approve
      if (req.roomId) {
        await this.assertRoomExistsOrThrow(req.roomId, manager);
        await this.assertRoomFreeOrThrow(
          req.roomId,
          req.startTime,
          req.endTime,
          undefined,
          manager,
        );
      }

      if (req.status === RequestStatus.REJECTED) {
        throw new ConflictException({
          code: ERROR.CONFLICT,
          message: 'Cannot approve a rejected request.',
        });
      }

      // enforce annex business rule (Zone 4 → Zone 3)
      await this.annexesService.assertAllAnnexesValidatedForRequest(
        req.id,
        manager,
      );

      // if already approved, return existing
      if (req.status === RequestStatus.APPROVED) {
        const existingEvent = await manager.findOne(Event, {
          where: { requestId: req.id },
          relations: ['room'],
        });

        if (existingEvent) {
          await queryRunner.commitTransaction();
          return {
            requestId: req.id,
            requestStatus: req.status,
            event: {
              id: existingEvent.id,
              title: req.title,
              description: req.description ?? '',
              eventType: req.eventType,
              clubName: req.club?.name ?? '',
              startTime: existingEvent.startTime.toISOString(),
              endTime: existingEvent.endTime.toISOString(),
              location: this.renderLocation(
                existingEvent.room?.name ?? null,
                existingEvent.externalAddress ?? null,
              ),
              isCancelled: existingEvent.isCancelled,
            },
          };
        }
        // fallthrough (rare) → approved but no event
      }

      // create event
      const event = manager.create(Event, {
        requestId: req.id,
        roomId: req.roomId ?? null,
        externalAddress: req.externalAddress ?? null,
        startTime: req.startTime,
        endTime: req.endTime,
        isCancelled: false,
      });
      const savedEvent = await manager.save(Event, event);

      // update request
      req.status = RequestStatus.APPROVED;
      req.adminComment = dto.comment?.trim() || null;
      await manager.save(EventRequest, req);

      this.logger.log(
        `[approveEventRequest] admin=${adminId} request=${req.id} -> event=${savedEvent.id}`,
      );

      await queryRunner.commitTransaction();

      return {
        requestId: req.id,
        requestStatus: req.status,
        event: {
          id: savedEvent.id,
          title: req.title,
          description: req.description ?? '',
          eventType: req.eventType,
          clubName: req.club?.name ?? '',
          startTime: savedEvent.startTime.toISOString(),
          endTime: savedEvent.endTime.toISOString(),
          location: this.renderLocation(
            req.room?.name ?? null,
            req.externalAddress ?? null,
          ),
          isCancelled: false,
        },
      };
    } catch (err) {
      await queryRunner.rollbackTransaction();
      // let global exception filter wrap it into ApiResponseDto
      throw err;
    } finally {
      await queryRunner.release();
    }
  }

  // ---------------------------------------------------------------------------
  // 6. POST /events/requests/:id/reject
  // ---------------------------------------------------------------------------
  async rejectEventRequest(
    adminId: string,
    requestId: string,
    dto: RejectEventRequestDto,
  ): Promise<EventRequestRejectResponseDto> {
    const queryRunner = this.dataSource.createQueryRunner();
    await queryRunner.connect();
    await queryRunner.startTransaction();

    try {
      const req = await queryRunner.manager.findOne(EventRequest, {
        where: { id: requestId },
      });
      if (!req) {
        throw new NotFoundException({
          code: ERROR.NOT_FOUND,
          message: 'Event request not found.',
        });
      }

      if (req.status === RequestStatus.APPROVED) {
        throw new ConflictException({
          code: ERROR.CONFLICT,
          message: 'Cannot reject an already approved request.',
        });
      }

      req.status = RequestStatus.REJECTED;
      req.adminComment = dto.comment.trim();
      await queryRunner.manager.save(EventRequest, req);

      this.logger.log(
        `[rejectEventRequest] admin=${adminId} request=${requestId} reason="${dto.comment}"`,
      );

      // TODO(Zone6): notifyClubEventRejected(req.clubId, dto.comment);

      await queryRunner.commitTransaction();

      return {
        id: req.id,
        status: req.status,
        adminComment: req.adminComment ?? '',
      };
    } catch (err) {
      await queryRunner.rollbackTransaction();
      throw err;
    } finally {
      await queryRunner.release();
    }
  }

  // ---------------------------------------------------------------------------
  // 7. GET /events/calendar  (public)  – (fixed window + pagination)
  // ---------------------------------------------------------------------------
  async getPublicCalendar(
    page = 1,
    limit = 30, // public can scroll a bit more
  ): Promise<PaginatedResponseDto<PublicEventListItemResponseDto>> {
    const safePage = page < 1 ? 1 : page;
    const safeLimit = Math.min(limit, 50); // hard cap to avoid dumping whole table
    const offset = (safePage - 1) * safeLimit;

    const now = this.nowUtc();
    const to = new Date(now.getTime() + CALENDAR_WINDOW_DAYS * 86400000);

    const baseQb = this.events
      .createQueryBuilder('e')
      .innerJoin(EventRequest, 'r', 'r.id = e.request_id')
      .innerJoin(Club, 'c', 'c.id = r.club_id')
      .leftJoin(Room, 'rm', 'rm.id = e.room_id')
      .where('e.start_time >= :now', { now })
      .andWhere('e.start_time <= :to', { to });

    // 1) data
    const dataQb = baseQb
      .clone()
      .orderBy('e.start_time', 'ASC')
      .offset(offset)
      .limit(safeLimit)
      .select([
        'e.id AS id',
        'r.title AS title',
        'c.name AS "clubName"',
        'e.start_time AS "startTime"',
        'e.end_time AS "endTime"',
        'rm.name AS "roomName"',
        'e.external_address AS "externalAddress"',
        'e.is_cancelled AS "isCancelled"',
        'r.description AS description',
      ]);

    // 2) count for the SAME window
    const countQb = baseQb.clone().select('COUNT(*)', 'cnt');

    const [rows, countResult] = await Promise.all([
      dataQb.getRawMany<{
        id: string;
        title: string;
        clubName: string;
        startTime: Date;
        endTime: Date;
        roomName: string | null;
        externalAddress: string | null;
        isCancelled: boolean;
        description: string | null;
      }>(),
      countQb.getRawOne<{ cnt: string }>(),
    ]);

    const total = Number(countResult?.cnt ?? 0);

    return {
      total,
      page: safePage,
      limit: safeLimit,
      totalPages: Math.ceil(total / safeLimit) || 1,
      data: rows.map((r) => ({
        id: r.id,
        title: r.title,
        clubName: r.clubName,
        startTime: r.startTime.toISOString(),
        endTime: r.endTime.toISOString(),
        location: this.renderLocation(r.roomName, r.externalAddress),
        isCancelled: r.isCancelled,
        description: r.description ?? '',
      })),
    };
  }

  // ---------------------------------------------------------------------------
  // 8. GET /events/:id  (public detail)
  // ---------------------------------------------------------------------------
  async getPublicEventById(
    eventId: string,
  ): Promise<PublicEventDetailResponseDto> {
    const row = await this.events
      .createQueryBuilder('e')
      .innerJoin(EventRequest, 'r', 'r.id = e.request_id')
      .innerJoin(Club, 'c', 'c.id = r.club_id')
      .leftJoin(Room, 'rm', 'rm.id = e.room_id')
      .where('e.id = :eventId', { eventId })
      .select([
        'e.id AS id',
        'r.title AS title',
        'r.description AS description',
        'r.event_type AS "eventType"',
        'c.name AS "clubName"',
        'e.start_time AS "startTime"',
        'e.end_time AS "endTime"',
        'rm.name AS "roomName"',
        'e.external_address AS "externalAddress"',
        'e.is_cancelled AS "isCancelled"',
      ])
      .getRawOne<{
        id: string;
        title: string;
        description: string | null;
        eventType: EventType;
        clubName: string;
        startTime: Date;
        endTime: Date;
        roomName: string | null;
        externalAddress: string | null;
        isCancelled: boolean;
      }>();

    if (!row) {
      throw new NotFoundException({
        code: ERROR.NOT_FOUND,
        message: 'Event not found.',
      });
    }

    return {
      id: row.id,
      title: row.title,
      description: row.description ?? '',
      eventType: row.eventType,
      clubName: row.clubName,
      startTime: row.startTime.toISOString(),
      endTime: row.endTime.toISOString(),
      location: this.renderLocation(row.roomName, row.externalAddress),
      isCancelled: row.isCancelled,
    };
  }

  // ---------------------------------------------------------------------------
  // 9. PATCH /events/:id/time
  // ---------------------------------------------------------------------------
  async rescheduleEvent(
    adminId: string,
    eventId: string,
    dto: RescheduleEventDto,
  ): Promise<EventRescheduleResponseDto> {
    const event = await this.events.findOne({
      where: { id: eventId },
      relations: ['room'],
    });
    if (!event) {
      throw new NotFoundException({
        code: ERROR.NOT_FOUND,
        message: 'Event not found.',
      });
    }

    const start = new Date(dto.startTime);
    const end = new Date(dto.endTime);
    if (end.getTime() <= start.getTime()) {
      throw new BadRequestException({
        code: ERROR.VALIDATION_ERROR,
        message: 'endTime must be greater than startTime.',
      });
    }

    // overlap check (only if internal)
    if (event.roomId) {
      await this.assertRoomFreeOrThrow(event.roomId, start, end, event.id);
    }

    event.startTime = start;
    event.endTime = end;
    await this.events.save(event);

    this.logger.log(
      `[rescheduleEvent] admin=${adminId} event=${eventId} -> ${dto.startTime} / ${dto.endTime}`,
    );

    // TODO(Zone6): notifyEventRescheduled(eventId);

    return {
      id: event.id,
      startTime: event.startTime.toISOString(),
      endTime: event.endTime.toISOString(),
    };
  }

  // ---------------------------------------------------------------------------
  // 10. PATCH /events/:id/room
  // ---------------------------------------------------------------------------
  async changeEventRoom(
    adminId: string,
    eventId: string,
    dto: ChangeEventRoomDto,
  ): Promise<EventRoomChangeResponseDto> {
    const event = await this.events.findOne({
      where: { id: eventId },
      relations: ['room'],
    });

    if (!event) {
      throw new NotFoundException({
        code: ERROR.NOT_FOUND,
        message: 'Event not found.',
      });
    }

    if (event.externalAddress) {
      throw new ForbiddenException({
        code: ERROR.FORBIDDEN,
        message: 'Cannot change room for an external event.',
      });
    }

    const room = await this.rooms.findOne({ where: { id: dto.roomId } });
    if (!room) {
      throw new BadRequestException({
        code: ERROR.VALIDATION_ERROR,
        message: 'Target room does not exist.',
      });
    }

    // overlap check for the NEW room
    await this.assertRoomFreeOrThrow(
      room.id,
      event.startTime,
      event.endTime,
      event.id,
    );

    event.roomId = room.id;
    await this.events.save(event);

    this.logger.log(
      `[changeEventRoom] admin=${adminId} event=${eventId} -> room=${room.id}`,
    );

    // TODO(Zone6): notifyEventRoomChanged(eventId, room.name);

    return {
      id: event.id,
      location: room.name,
    };
  }

  // ---------------------------------------------------------------------------
  // 11. PATCH /events/:id/cancel
  // ---------------------------------------------------------------------------
  async cancelEvent(
    adminId: string,
    eventId: string,
  ): Promise<EventCancelResponseDto> {
    const event = await this.events.findOne({ where: { id: eventId } });
    if (!event) {
      throw new NotFoundException({
        code: ERROR.NOT_FOUND,
        message: 'Event not found.',
      });
    }

    event.isCancelled = true;
    await this.events.save(event);

    this.logger.log(
      `[cancelEvent] admin=${adminId} event=${eventId} -> cancelled`,
    );

    // TODO(Zone6): notifyEventCancelled(eventId);

    return {
      id: event.id,
      isCancelled: true,
    };
  }

  // ---------------------------------------------------------------------------
  // 12. GET /events/rooms
  // ---------------------------------------------------------------------------
  async listRooms(): Promise<RoomResponseDto[]> {
    const rooms = await this.rooms.find({ order: { name: 'ASC' } });

    return rooms.map((r) => ({
      id: r.id,
      name: r.name,
    }));
  }

  // ---------------------------------------------------------------------------
  // 13. POST /events/rooms
  // ---------------------------------------------------------------------------
  async createRoom(
    adminId: string,
    dto: CreateRoomDto,
  ): Promise<RoomCreateResponseDto> {
    const name = dto.name.trim();
    if (!name) {
      throw new BadRequestException({
        code: ERROR.VALIDATION_ERROR,
        message: 'Room name cannot be empty.',
      });
    }

    const exists = await this.rooms.findOne({
      where: { name },
      select: ['id'],
    });

    if (exists) {
      throw new ConflictException({
        code: ERROR.CONFLICT,
        message: 'Room name already exists.',
      });
    }

    const room = this.rooms.create({
      name,
    });
    const saved = await this.rooms.save(room);

    this.logger.log(
      `[createRoom] admin=${adminId} room=${saved.id} name="${saved.name}"`,
    );

    return {
      id: saved.id,
      name: saved.name,
    };
  }

  // ---------------------------------------------------------------------------
  // 14. DELETE /events/rooms/:id
  // ---------------------------------------------------------------------------
  async deleteRoom(adminId: string, roomId: string): Promise<void> {
    const room = await this.rooms.findOne({ where: { id: roomId } });
    if (!room) {
      throw new NotFoundException({
        code: ERROR.NOT_FOUND,
        message: 'Room not found.',
      });
    }

    const now = this.nowUtc();

    const hasFutureEvents = await this.events.exist({
      where: {
        roomId: room.id,
        startTime: MoreThanOrEqual(now),
      },
    });

    if (hasFutureEvents) {
      throw new ConflictException({
        code: ERROR.CONFLICT,
        message: 'Cannot delete room: it is used by scheduled events.',
      });
    }

    const hasPendingRequests = await this.requests.exist({
      where: {
        roomId: room.id,
        status: RequestStatus.PENDING,
      },
    });

    if (hasPendingRequests) {
      throw new ConflictException({
        code: ERROR.CONFLICT,
        message: 'Cannot delete room: it is used by pending event requests.',
      });
    }

    await this.rooms.delete({ id: room.id });

    this.logger.log(`[deleteRoom] admin=${adminId} room=${roomId} deleted`);
  }
}
