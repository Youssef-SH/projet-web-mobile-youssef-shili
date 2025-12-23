import {
  Body,
  Controller,
  DefaultValuePipe,
  Delete,
  Get,
  HttpCode,
  HttpStatus,
  Param,
  ParseIntPipe,
  Patch,
  Post,
  Query,
  UploadedFiles,
  UseInterceptors,
} from '@nestjs/common';
import {
  ApiBadRequestResponse,
  ApiBearerAuth,
  ApiBody,
  ApiConflictResponse,
  ApiConsumes,
  ApiCreatedResponse,
  ApiExtraModels,
  ApiForbiddenResponse,
  ApiNoContentResponse,
  ApiOkResponse,
  ApiOperation,
  ApiParam,
  ApiTags,
  ApiUnauthorizedResponse,
  getSchemaPath,
} from '@nestjs/swagger';
import { AnyFilesInterceptor } from '@nestjs/platform-express';

import { EventsService } from '../services/events.service';

import { Roles } from 'src/common/decorators/roles.decorator';
import { CurrentUser } from 'src/common/decorators/current-user.decorator';
import { Public } from 'src/common/decorators/public.decorator';

import { UserRole } from 'src/common/enums/user-role.enum';

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
  PublicEventListItemResponseDto,
  PublicEventDetailResponseDto,
  EventRescheduleResponseDto,
  EventRoomChangeResponseDto,
  EventCancelResponseDto,
  RoomResponseDto,
  RoomCreateResponseDto,
} from '../dto/responses';

import { PaginatedResponseDto } from 'src/common/dto/paginated-response.dto';
import { ApiResponseDto } from 'src/common/dto/api-response.dto';
import { ApiPaginationQuery } from 'src/common/decorators/api-pagination-query.decorator';

@ApiTags('Events')
@ApiExtraModels(
  ApiResponseDto,
  // queries
  AdminEventRequestsQueryDto,
  ClubEventRequestsQueryDto,
  // requests
  CreateEventRequestDto,
  ApproveEventRequestDto,
  RejectEventRequestDto,
  RescheduleEventDto,
  ChangeEventRoomDto,
  CreateRoomDto,
  // responses
  CreateEventRequestResponseDto,
  AdminEventRequestListItemResponseDto,
  ClubEventRequestListItemResponseDto,
  AdminEventRequestDetailResponseDto,
  ClubEventRequestDetailResponseDto,
  EventRequestApproveResponseDto,
  EventRequestRejectResponseDto,
  PublicEventListItemResponseDto,
  PublicEventDetailResponseDto,
  EventRescheduleResponseDto,
  EventRoomChangeResponseDto,
  EventCancelResponseDto,
  RoomResponseDto,
  RoomCreateResponseDto,
  PaginatedResponseDto,
)
@Controller('events')
export class EventsController {
  constructor(private readonly events: EventsService) {}

  // ---------------------------------------------------------------------------
  // 1. POST /events/requests – club creates event request (with annexes)
  // ---------------------------------------------------------------------------
  @Post('requests')
  @HttpCode(HttpStatus.CREATED)
  @ApiBearerAuth()
  @Roles(UserRole.CLUB)
  @UseInterceptors(AnyFilesInterceptor())
  @ApiConsumes('multipart/form-data')
  @ApiOperation({
    summary: 'Create event request (club)',
    description:
      'Club submits an event request with all required annexes. Each annex field must be named `annex_{templateId}`. Unknown/extra files are ignored.',
    operationId: 'events_createRequest',
  })
  @ApiBody({
    schema: {
      type: 'object',
      properties: {
        title: { type: 'string', example: 'AI Day 2025' },
        description: { type: 'string', example: 'Talks + workshops' },
        eventType: { type: 'string', example: 'Scientific' },
        startTime: {
          type: 'string',
          format: 'date-time',
          example: '2025-11-18T09:00:00Z',
        },
        endTime: {
          type: 'string',
          format: 'date-time',
          example: '2025-11-18T17:00:00Z',
        },
        expectedStudents: { type: 'number', example: 200 },
        roomId: {
          type: 'string',
          format: 'uuid',
          nullable: true,
          description:
            'Exactly one of roomId or externalAddress must be provided.',
        },
        externalAddress: {
          type: 'string',
          nullable: true,
          description:
            'Exactly one of roomId or externalAddress must be provided.',
        },
        submittedBy: {
          type: 'string',
          format: 'uuid',
          description:
            'Leader UUID (must be the club President or VicePresident).',
        },
        'annex_11111111-1111-1111-1111-111111111111': {
          type: 'string',
          format: 'binary',
          description:
            'Annex file for template 11111111-1111-1111-1111-111111111111',
        },
      },
      required: ['title', 'eventType', 'startTime', 'endTime', 'submittedBy'],
    },
  })
  @ApiCreatedResponse({
    description: 'Event request created',
    schema: {
      allOf: [
        { $ref: getSchemaPath(ApiResponseDto) },
        {
          properties: {
            data: { $ref: getSchemaPath(CreateEventRequestResponseDto) },
          },
        },
      ],
    },
  })
  @ApiUnauthorizedResponse({
    description: 'Invalid or missing authentication',
    type: ApiResponseDto,
  })
  @ApiBadRequestResponse({
    description: 'Validation failed, missing/extra annexes, or bad timing',
    schema: { $ref: getSchemaPath(ApiResponseDto) },
  })
  @ApiForbiddenResponse({
    description: 'Only clubs can submit event requests',
    schema: { $ref: getSchemaPath(ApiResponseDto) },
  })
  @ApiConflictResponse({
    description:
      'Duplicate event request, room disappeared, or schedule conflict',
    schema: { $ref: getSchemaPath(ApiResponseDto) },
  })
  async createEventRequest(
    @CurrentUser() user: { id: string },
    @Body() dto: CreateEventRequestDto,
    @UploadedFiles() files: Express.Multer.File[],
  ): Promise<{ data: CreateEventRequestResponseDto }> {
    const data = await this.events.createEventRequestWithAnnexes(
      user.id,
      dto,
      files ?? [],
    );
    return { data };
  }

  // ---------------------------------------------------------------------------
  // 2. GET /events/requests – admin list
  // ---------------------------------------------------------------------------
  @Get('requests')
  @ApiBearerAuth()
  @Roles(UserRole.ADMIN)
  @ApiOperation({
    summary: 'List event requests (admin)',
    description:
      'Paginated list of all event requests. Can be filtered by status and clubId. Sorted by submittedAt DESC.',
    operationId: 'events_adminListRequests',
  })
  @ApiPaginationQuery()
  @ApiOkResponse({
    description: 'Event requests returned',
    schema: {
      allOf: [
        { $ref: getSchemaPath(ApiResponseDto) },
        {
          properties: {
            data: {
              allOf: [
                { $ref: getSchemaPath(PaginatedResponseDto) },
                {
                  properties: {
                    data: {
                      type: 'array',
                      items: {
                        $ref: getSchemaPath(
                          AdminEventRequestListItemResponseDto,
                        ),
                      },
                    },
                  },
                },
              ],
            },
          },
        },
      ],
    },
  })
  @ApiUnauthorizedResponse({
    description: 'Invalid or missing authentication',
    type: ApiResponseDto,
  })
  async adminListEventRequests(
    @Query() query: AdminEventRequestsQueryDto,
  ): Promise<{
    data: PaginatedResponseDto<AdminEventRequestListItemResponseDto>;
  }> {
    const data = await this.events.adminListEventRequests(query);
    return { data };
  }

  // ---------------------------------------------------------------------------
  // 3. GET /events/requests/me – club list own requests
  // ---------------------------------------------------------------------------
  @Get('requests/me')
  @ApiBearerAuth()
  @Roles(UserRole.CLUB)
  @ApiOperation({
    summary: 'List own event requests (club)',
    description:
      'Returns the authenticated club’s own requests (newest first).',
    operationId: 'events_clubListOwnRequests',
  })
  @ApiPaginationQuery()
  @ApiOkResponse({
    description: 'Club event requests returned',
    schema: {
      allOf: [
        { $ref: getSchemaPath(ApiResponseDto) },
        {
          properties: {
            data: {
              allOf: [
                { $ref: getSchemaPath(PaginatedResponseDto) },
                {
                  properties: {
                    data: {
                      type: 'array',
                      items: {
                        $ref: getSchemaPath(
                          ClubEventRequestListItemResponseDto,
                        ),
                      },
                    },
                  },
                },
              ],
            },
          },
        },
      ],
    },
  })
  @ApiUnauthorizedResponse({
    description: 'Invalid or missing authentication',
    type: ApiResponseDto,
  })
  async clubListOwnEventRequests(
    @CurrentUser() user: { id: string },
    @Query() query: ClubEventRequestsQueryDto,
  ): Promise<{
    data: PaginatedResponseDto<ClubEventRequestListItemResponseDto>;
  }> {
    const data = await this.events.clubListOwnEventRequests(user.id, query);
    return { data };
  }

  // ---------------------------------------------------------------------------
  // 4. GET /events/requests/:id – role-shaped
  // ---------------------------------------------------------------------------
  @Get('requests/:id')
  @ApiBearerAuth()
  @Roles(UserRole.ADMIN, UserRole.CLUB)
  @ApiParam({
    name: 'id',
    description: 'Event request UUID',
    required: true,
  })
  @ApiOperation({
    summary: 'Get single event request (role-shaped)',
    description:
      'Admins get the full internal view (club contact + annexes). Clubs get their own view (no annexes).',
    operationId: 'events_getRequest',
  })
  @ApiOkResponse({
    description: 'Event request returned (role-shaped)',
    schema: {
      oneOf: [
        {
          allOf: [
            { $ref: getSchemaPath(ApiResponseDto) },
            {
              properties: {
                data: {
                  $ref: getSchemaPath(AdminEventRequestDetailResponseDto),
                },
              },
            },
          ],
        },
        {
          allOf: [
            { $ref: getSchemaPath(ApiResponseDto) },
            {
              properties: {
                data: {
                  $ref: getSchemaPath(ClubEventRequestDetailResponseDto),
                },
              },
            },
          ],
        },
      ],
    },
  })
  @ApiUnauthorizedResponse({
    description: 'Invalid or missing authentication',
    type: ApiResponseDto,
  })
  @ApiForbiddenResponse({
    description: 'Only admins or owning clubs can view event requests',
    type: ApiResponseDto,
  })
  async getEventRequest(
    @CurrentUser() user: { id: string; role: UserRole },
    @Param('id') requestId: string,
  ): Promise<{
    data:
      | AdminEventRequestDetailResponseDto
      | ClubEventRequestDetailResponseDto;
  }> {
    if (user.role === UserRole.ADMIN) {
      const data = await this.events.getEventRequestForAdmin(requestId);
      return { data };
    }
    const data = await this.events.getEventRequestForClub(user.id, requestId);
    return { data };
  }

  // ---------------------------------------------------------------------------
  // 5. POST /events/requests/:id/approve – admin approves
  // ---------------------------------------------------------------------------
  @Post('requests/:id/approve')
  @HttpCode(HttpStatus.CREATED)
  @ApiBearerAuth()
  @Roles(UserRole.ADMIN)
  @ApiParam({
    name: 'id',
    description: 'Event request UUID to approve',
    required: true,
  })
  @ApiOperation({
    summary: 'Approve event request',
    description: 'Approves the request and creates the live event. Idempotent.',
    operationId: 'events_approveRequest',
  })
  @ApiCreatedResponse({
    description: 'Event request approved',
    schema: {
      allOf: [
        { $ref: getSchemaPath(ApiResponseDto) },
        {
          properties: {
            data: { $ref: getSchemaPath(EventRequestApproveResponseDto) },
          },
        },
      ],
    },
  })
  @ApiUnauthorizedResponse({
    description: 'Invalid or missing authentication',
    type: ApiResponseDto,
  })
  @ApiBadRequestResponse({
    description: 'Invalid payload',
    schema: { $ref: getSchemaPath(ApiResponseDto) },
  })
  @ApiForbiddenResponse({
    description: 'Only admins can approve event requests',
    schema: { $ref: getSchemaPath(ApiResponseDto) },
  })
  @ApiConflictResponse({
    description:
      'Request is not in a state that can be approved / room conflict',
    schema: { $ref: getSchemaPath(ApiResponseDto) },
  })
  async approveEventRequest(
    @CurrentUser() user: { id: string },
    @Param('id') requestId: string,
    @Body() dto: ApproveEventRequestDto,
  ): Promise<{ data: EventRequestApproveResponseDto }> {
    const data = await this.events.approveEventRequest(user.id, requestId, dto);
    return { data };
  }

  // ---------------------------------------------------------------------------
  // 6. POST /events/requests/:id/reject – admin rejects
  // ---------------------------------------------------------------------------
  @Post('requests/:id/reject')
  @HttpCode(HttpStatus.OK)
  @ApiBearerAuth()
  @Roles(UserRole.ADMIN)
  @ApiParam({
    name: 'id',
    description: 'Event request UUID to reject',
    required: true,
  })
  @ApiOperation({
    summary: 'Reject event request',
    description: 'Rejects the request with a mandatory comment.',
    operationId: 'events_rejectRequest',
  })
  @ApiOkResponse({
    description: 'Event request rejected',
    schema: {
      allOf: [
        { $ref: getSchemaPath(ApiResponseDto) },
        {
          properties: {
            data: { $ref: getSchemaPath(EventRequestRejectResponseDto) },
          },
        },
      ],
    },
  })
  @ApiUnauthorizedResponse({
    description: 'Invalid or missing authentication',
    type: ApiResponseDto,
  })
  @ApiForbiddenResponse({
    description: 'Only admins can reject event requests',
    type: ApiResponseDto,
  })
  async rejectEventRequest(
    @CurrentUser() user: { id: string },
    @Param('id') requestId: string,
    @Body() dto: RejectEventRequestDto,
  ): Promise<{ data: EventRequestRejectResponseDto }> {
    const data = await this.events.rejectEventRequest(user.id, requestId, dto);
    return { data };
  }

  // ---------------------------------------------------------------------------
  // 7. GET /events/calendar – public
  // ---------------------------------------------------------------------------
  @Public()
  @Get('calendar')
  @HttpCode(HttpStatus.OK)
  @ApiOperation({
    summary: 'Public calendar (upcoming events)',
    description:
      'Returns upcoming events in the next N days (e.g. 30). No filters.',
    operationId: 'events_getPublicCalendar',
  })
  @ApiPaginationQuery()
  @ApiOkResponse({
    description: 'Public calendar returned',
    schema: {
      allOf: [
        { $ref: getSchemaPath(ApiResponseDto) },
        {
          properties: {
            data: {
              allOf: [
                { $ref: getSchemaPath(PaginatedResponseDto) },
                {
                  properties: {
                    data: {
                      type: 'array',
                      items: {
                        $ref: getSchemaPath(PublicEventListItemResponseDto),
                      },
                    },
                  },
                },
              ],
            },
          },
        },
      ],
    },
  })
  async getPublicCalendar(
    @Query('page', new DefaultValuePipe(1), ParseIntPipe) page: number,
    @Query('limit', new DefaultValuePipe(30), ParseIntPipe) limit: number,
  ): Promise<{ data: PaginatedResponseDto<PublicEventListItemResponseDto> }> {
    const data = await this.events.getPublicCalendar(page, limit);
    return { data };
  }

  // ---------------------------------------------------------------------------
  // 8. GET /events/rooms – list rooms (club/admin)
  // ---------------------------------------------------------------------------
  @Get('rooms')
  @ApiBearerAuth()
  @Roles(UserRole.CLUB, UserRole.ADMIN)
  @ApiOperation({
    summary: 'List internal rooms',
    description:
      'Used by clubs when creating event requests and by admins to manage rooms.',
    operationId: 'events_listRooms',
  })
  @ApiOkResponse({
    description: 'Rooms returned',
    schema: {
      allOf: [
        { $ref: getSchemaPath(ApiResponseDto) },
        {
          properties: {
            data: {
              type: 'array',
              items: { $ref: getSchemaPath(RoomResponseDto) },
            },
          },
        },
      ],
    },
  })
  async listRooms(): Promise<{ data: RoomResponseDto[] }> {
    const data = await this.events.listRooms();
    return { data };
  }

  // ---------------------------------------------------------------------------
  // 9. POST /events/rooms – create room (admin)
  // ---------------------------------------------------------------------------
  @Post('rooms')
  @HttpCode(HttpStatus.CREATED)
  @ApiBearerAuth()
  @Roles(UserRole.ADMIN)
  @ApiOperation({
    summary: 'Create internal room',
    description: 'Admin-only. Creates a new bookable internal room.',
    operationId: 'events_createRoom',
  })
  @ApiCreatedResponse({
    description: 'Room created',
    schema: {
      allOf: [
        { $ref: getSchemaPath(ApiResponseDto) },
        {
          properties: {
            data: { $ref: getSchemaPath(RoomCreateResponseDto) },
          },
        },
      ],
    },
  })
  @ApiUnauthorizedResponse({
    description: 'Invalid or missing authentication',
    type: ApiResponseDto,
  })
  @ApiBadRequestResponse({
    description: 'Room name cannot be empty',
    schema: { $ref: getSchemaPath(ApiResponseDto) },
  })
  @ApiConflictResponse({
    description: 'Room name already exists',
    schema: { $ref: getSchemaPath(ApiResponseDto) },
  })
  async createRoom(
    @CurrentUser() user: { id: string },
    @Body() dto: CreateRoomDto,
  ): Promise<{ data: RoomCreateResponseDto }> {
    const data = await this.events.createRoom(user.id, dto);
    return { data };
  }

  // ---------------------------------------------------------------------------
  // 10. DELETE /events/rooms/:id – delete room (admin)
  // ---------------------------------------------------------------------------
  @Delete('rooms/:id')
  @ApiBearerAuth()
  @Roles(UserRole.ADMIN)
  @HttpCode(HttpStatus.NO_CONTENT)
  @ApiParam({
    name: 'id',
    description: 'Room UUID',
    required: true,
  })
  @ApiOperation({
    summary: 'Delete room',
    description:
      'Admin-only. Fails if room is used by pending requests or upcoming events.',
    operationId: 'events_deleteRoom',
  })
  @ApiNoContentResponse({
    description: 'Room deleted',
  })
  @ApiUnauthorizedResponse({
    description: 'Invalid or missing authentication',
    type: ApiResponseDto,
  })
  @ApiConflictResponse({
    description: 'Room is used by scheduled events or pending requests',
    schema: { $ref: getSchemaPath(ApiResponseDto) },
  })
  async deleteRoom(
    @CurrentUser() user: { id: string },
    @Param('id') roomId: string,
  ): Promise<void> {
    await this.events.deleteRoom(user.id, roomId);
  }

  // ---------------------------------------------------------------------------
  // 11. PATCH /events/:id/time – reschedule
  // ---------------------------------------------------------------------------
  @Patch(':id/time')
  @ApiBearerAuth()
  @Roles(UserRole.ADMIN)
  @ApiParam({
    name: 'id',
    description: 'Event UUID to reschedule',
    required: true,
  })
  @ApiOperation({
    summary: 'Reschedule event (admin)',
    description: 'Changes start/end time of an approved event.',
    operationId: 'events_reschedule',
  })
  @ApiOkResponse({
    description: 'Event rescheduled',
    schema: {
      allOf: [
        { $ref: getSchemaPath(ApiResponseDto) },
        {
          properties: {
            data: { $ref: getSchemaPath(EventRescheduleResponseDto) },
          },
        },
      ],
    },
  })
  @ApiUnauthorizedResponse({
    description: 'Invalid or missing authentication',
    type: ApiResponseDto,
  })
  @ApiBadRequestResponse({
    description: 'endTime must be greater than startTime / invalid payload',
    schema: { $ref: getSchemaPath(ApiResponseDto) },
  })
  @ApiConflictResponse({
    description: 'Room is already booked for that time range',
    schema: { $ref: getSchemaPath(ApiResponseDto) },
  })
  async rescheduleEvent(
    @CurrentUser() user: { id: string },
    @Param('id') eventId: string,
    @Body() dto: RescheduleEventDto,
  ): Promise<{ data: EventRescheduleResponseDto }> {
    const data = await this.events.rescheduleEvent(user.id, eventId, dto);
    return { data };
  }

  // ---------------------------------------------------------------------------
  // 12. PATCH /events/:id/room – change room
  // ---------------------------------------------------------------------------
  @Patch(':id/room')
  @ApiBearerAuth()
  @Roles(UserRole.ADMIN)
  @ApiParam({
    name: 'id',
    description: 'Event UUID to move',
    required: true,
  })
  @ApiOperation({
    summary: 'Change event room (admin)',
    description:
      'Moves an internal event to another room. Fails for external events or overlapping schedules.',
    operationId: 'events_changeRoom',
  })
  @ApiOkResponse({
    description: 'Event room changed',
    schema: {
      allOf: [
        { $ref: getSchemaPath(ApiResponseDto) },
        {
          properties: {
            data: { $ref: getSchemaPath(EventRoomChangeResponseDto) },
          },
        },
      ],
    },
  })
  @ApiUnauthorizedResponse({
    description: 'Invalid or missing authentication',
    type: ApiResponseDto,
  })
  @ApiForbiddenResponse({
    description: 'Cannot change room for an external event.',
    schema: { $ref: getSchemaPath(ApiResponseDto) },
  })
  @ApiBadRequestResponse({
    description: 'Target room does not exist.',
    schema: { $ref: getSchemaPath(ApiResponseDto) },
  })
  @ApiConflictResponse({
    description: 'New room is already booked for that time.',
    schema: { $ref: getSchemaPath(ApiResponseDto) },
  })
  async changeEventRoom(
    @CurrentUser() user: { id: string },
    @Param('id') eventId: string,
    @Body() dto: ChangeEventRoomDto,
  ): Promise<{ data: EventRoomChangeResponseDto }> {
    const data = await this.events.changeEventRoom(user.id, eventId, dto);
    return { data };
  }

  // ---------------------------------------------------------------------------
  // 13. PATCH /events/:id/cancel – cancel event
  // ---------------------------------------------------------------------------
  @Patch(':id/cancel')
  @ApiBearerAuth()
  @Roles(UserRole.ADMIN)
  @ApiParam({
    name: 'id',
    description: 'Event UUID to cancel',
    required: true,
  })
  @ApiOperation({
    summary: 'Cancel event (admin)',
    description:
      'Marks the event as cancelled. Still visible in public calendar.',
    operationId: 'events_cancel',
  })
  @ApiOkResponse({
    description: 'Event cancelled',
    schema: {
      allOf: [
        { $ref: getSchemaPath(ApiResponseDto) },
        {
          properties: {
            data: { $ref: getSchemaPath(EventCancelResponseDto) },
          },
        },
      ],
    },
  })
  @ApiUnauthorizedResponse({
    description: 'Invalid or missing authentication',
    type: ApiResponseDto,
  })
  async cancelEvent(
    @CurrentUser() user: { id: string },
    @Param('id') eventId: string,
  ): Promise<{ data: EventCancelResponseDto }> {
    const data = await this.events.cancelEvent(user.id, eventId);
    return { data };
  }

  // ---------------------------------------------------------------------------
  // 14. GET /events/:id – public detail (kept LAST)
  // ---------------------------------------------------------------------------
  @Public()
  @Get(':id')
  @ApiParam({
    name: 'id',
    description: 'Public event UUID',
    required: true,
  })
  @ApiOperation({
    summary: 'Get public event details',
    description:
      'Public endpoint. Returns title, club, time, location, description, and isCancelled.',
    operationId: 'events_getPublicById',
  })
  @ApiOkResponse({
    description: 'Public event returned',
    schema: {
      allOf: [
        { $ref: getSchemaPath(ApiResponseDto) },
        {
          properties: {
            data: { $ref: getSchemaPath(PublicEventDetailResponseDto) },
          },
        },
      ],
    },
  })
  async getPublicEventById(
    @Param('id') eventId: string,
  ): Promise<{ data: PublicEventDetailResponseDto }> {
    const data = await this.events.getPublicEventById(eventId);
    return { data };
  }
}
