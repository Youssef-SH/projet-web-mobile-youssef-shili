import { ApiProperty } from '@nestjs/swagger';
import { RequestStatus } from '../../entities/enums/request-status.enum';

export class ClubEventRequestListItemResponseDto {
  @ApiProperty({
    description: 'Event request identifier.',
    example: 'f9231a59-6d95-4a30-9ab6-1e2f3fcb56f3',
    format: 'uuid',
  })
  readonly id!: string;

  @ApiProperty({
    description: 'Title of the requested event.',
    example: 'AI Day 2025',
  })
  readonly title!: string;

  @ApiProperty({
    description: 'Current status of this request for the club.',
    enum: RequestStatus,
    example: RequestStatus.PENDING,
  })
  readonly status!: RequestStatus;

  @ApiProperty({
    description: 'Requested start time of the event.',
    example: '2025-11-18T09:00:00Z',
    format: 'date-time',
  })
  readonly startTime!: string;

  @ApiProperty({
    description: 'Requested end time of the event.',
    example: '2025-11-18T17:00:00Z',
    format: 'date-time',
  })
  readonly endTime!: string;

  @ApiProperty({
    description:
      'Renderable location (room name if internal, external address if off-campus).',
    example: 'Amphi A',
  })
  readonly location!: string;
}
