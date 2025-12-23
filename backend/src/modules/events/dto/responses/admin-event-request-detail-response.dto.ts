import { ApiProperty } from '@nestjs/swagger';
import { EventType } from '../../entities/enums/event-type.enum';
import { RequestStatus } from '../../entities/enums/request-status.enum';
import { AnnexViewDto } from '../../../../common/dto/annex-view.dto';

export class AdminEventRequestDetailResponseDto {
  @ApiProperty({
    description: 'Event request identifier.',
    example: '0dbe80e4-8d39-4d1a-a5ba-26dfb7f7815c',
    format: 'uuid',
  })
  readonly id!: string;

  @ApiProperty({
    description: 'Club that submitted this request.',
    example: '1d9bb75e-5e27-4b9a-9135-6a89ba9110ce',
    format: 'uuid',
  })
  readonly clubId!: string;

  @ApiProperty({
    description: 'Information about the club leader who submitted the request.',
    example: {
      role: 'President',
      fullName: 'Alice Mansouri',
      email: 'alice@isimm.tn',
      phone: '22000000',
      cin: '12345678',
      studyLevel: 'ING2',
      specialization: 'GL',
    },
  })
  readonly submittedBy!: {
    readonly role: string;
    readonly fullName: string;
    readonly email: string;
    readonly phone: string;
    readonly cin: string;
    readonly studyLevel: string;
    readonly specialization: string;
  };

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
    description: 'Expected number of attendees/students.',
    example: 200,
  })
  readonly expectedStudents!: number;

  @ApiProperty({
    description:
      'Internal room where the event will take place. Mutually exclusive with externalAddress.',
    example: '5d294bf9-00ef-4a79-9b1d-6f0cb4c918d4',
    format: 'uuid',
    nullable: true,
  })
  readonly roomId!: string | null;

  @ApiProperty({
    description:
      'External address (for off-campus events). Mutually exclusive with roomId.',
    example: null,
    nullable: true,
  })
  readonly externalAddress!: string | null;

  @ApiProperty({
    description: 'Current status of the event request.',
    enum: RequestStatus,
    example: RequestStatus.PENDING,
  })
  readonly status!: RequestStatus;

  @ApiProperty({
    description:
      'Admin comment associated with the approval/rejection of this request.',
    example: null,
    nullable: true,
  })
  readonly adminComment!: string | null;

  @ApiProperty({
    description: 'Date/time when the club submitted this request.',
    example: '2025-11-08T10:00:00Z',
    format: 'date-time',
  })
  readonly submittedAt!: string;

  @ApiProperty({
    description: 'List of annexes attached to this event request.',
    type: [AnnexViewDto],
  })
  readonly annexes!: readonly AnnexViewDto[];
}
