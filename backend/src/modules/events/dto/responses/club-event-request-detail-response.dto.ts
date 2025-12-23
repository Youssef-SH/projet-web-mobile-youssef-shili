import { ApiProperty } from '@nestjs/swagger';
import { EventType } from '../../entities/enums/event-type.enum';
import { RequestStatus } from '../../entities/enums/request-status.enum';

export class ClubEventRequestDetailResponseDto {
  @ApiProperty({
    description: 'Event request identifier.',
    example: 'f82a70d1-2a9b-4bde-9c8c-1a905fc47588',
    format: 'uuid',
  })
  readonly id!: string;

  @ApiProperty({
    description: 'Title of the requested event.',
    example: 'AI Day 2025',
  })
  readonly title!: string;

  @ApiProperty({
    description: 'Description / context of the event.',
    example: 'Talks + workshops',
  })
  readonly description!: string;

  @ApiProperty({
    description: 'Type of the event.',
    enum: EventType,
    example: EventType.SCIENTIFIC,
  })
  readonly eventType!: EventType;

  @ApiProperty({
    description: 'Planned start date/time for the event.',
    example: '2025-11-18T09:00:00Z',
    format: 'date-time',
  })
  readonly startTime!: string;

  @ApiProperty({
    description: 'Planned end date/time for the event.',
    example: '2025-11-18T17:00:00Z',
    format: 'date-time',
  })
  readonly endTime!: string;

  @ApiProperty({
    description: 'If the event is internal, this is the chosen room.',
    example: '5d294bf9-00ef-4a79-9b1d-6f0cb4c918d4',
    format: 'uuid',
    nullable: true,
  })
  readonly roomId!: string | null;

  @ApiProperty({
    description:
      'If the event is external, this is the chosen location. Mutually exclusive with roomId.',
    example: null,
    nullable: true,
  })
  readonly externalAddress!: string | null;

  @ApiProperty({
    description: 'Current status of the request from the club perspective.',
    enum: RequestStatus,
    example: RequestStatus.PENDING,
  })
  readonly status!: RequestStatus;

  @ApiProperty({
    description:
      'Admin comment if the request was approved/rejected, shown to the club.',
    example: null,
    nullable: true,
  })
  readonly adminComment!: string | null;

  @ApiProperty({
    description:
      'Club role of the leader who sent the request. We only show the role to the club.',
    example: 'President',
  })
  readonly submittedBy!: {
    readonly role: string;
  };

  @ApiProperty({
    description: 'Date/time when the club submitted this request.',
    example: '2025-11-08T10:00:00Z',
    format: 'date-time',
  })
  readonly submittedAt!: string;
}
