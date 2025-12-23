import { ApiProperty } from '@nestjs/swagger';
import { EventType } from '../../entities/enums/event-type.enum';
import { RequestStatus } from '../../entities/enums/request-status.enum';
import { ClubRole } from 'src/common/enums/club-role.enum';

export class AdminEventRequestListItemResponseDto {
  @ApiProperty({
    description: 'Event request identifier.',
    example: 'c7af1656-1e1b-4fb8-af36-b1f3a3cbb731',
    format: 'uuid',
  })
  readonly id!: string;

  @ApiProperty({
    description: 'Title of the requested event.',
    example: 'AI Day 2025',
  })
  readonly title!: string;

  @ApiProperty({
    description: 'Type/category of the event.',
    enum: EventType,
    example: EventType.SCIENTIFIC,
  })
  readonly eventType!: EventType;

  @ApiProperty({
    description: 'Name of the club that submitted the request.',
    example: 'IEEE ISIMM',
  })
  readonly clubName!: string;

  @ApiProperty({
    description: 'Current workflow status of the request.',
    enum: RequestStatus,
    example: RequestStatus.PENDING,
  })
  readonly status!: RequestStatus;

  @ApiProperty({
    description: 'Event start time (from the request).',
    example: '2025-11-18T09:00:00Z',
    format: 'date-time',
  })
  readonly startTime!: string;

  @ApiProperty({
    description: 'Event end time (from the request).',
    example: '2025-11-18T17:00:00Z',
    format: 'date-time',
  })
  readonly endTime!: string;

  @ApiProperty({
    description: 'When this request was submitted by the club.',
    example: '2025-11-08T10:00:00Z',
    format: 'date-time',
  })
  readonly submittedAt!: string;

  @ApiProperty({
    description:
      'Role of the club leader who submitted the request. Exposed here to let admin see accountability level without PII.',
    enum: ClubRole,
    example: ClubRole.PRESIDENT,
  })
  readonly submittedByRole!: ClubRole;
}
