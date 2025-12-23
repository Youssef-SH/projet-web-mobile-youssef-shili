import { ApiProperty } from '@nestjs/swagger';
import { EventType } from '../../entities/enums/event-type.enum';

export class PublicEventDetailResponseDto {
  @ApiProperty({
    description: 'Public event identifier.',
    example: 'd2c8ef7b-75e2-4a14-8d8f-54dc40757b3f',
    format: 'uuid',
  })
  readonly id!: string;

  @ApiProperty({
    description: 'Title of the event.',
    example: 'AI Day 2025',
  })
  readonly title!: string;

  @ApiProperty({
    description: 'Longer description / program / context.',
    example: 'Talks + workshops',
  })
  readonly description!: string;

  @ApiProperty({
    description: 'Event type/category.',
    enum: EventType,
    example: EventType.SCIENTIFIC,
  })
  readonly eventType!: EventType;

  @ApiProperty({
    description: 'Name of the club organizing the event.',
    example: 'IEEE ISIMM',
  })
  readonly clubName!: string;

  @ApiProperty({
    description: 'Start time of the event.',
    example: '2025-11-18T09:00:00Z',
    format: 'date-time',
  })
  readonly startTime!: string;

  @ApiProperty({
    description: 'End time of the event.',
    example: '2025-11-18T17:00:00Z',
    format: 'date-time',
  })
  readonly endTime!: string;

  @ApiProperty({
    description:
      'Location to be displayed to users. Either an internal room name or an external address.',
    example: 'Amphi A',
  })
  readonly location!: string;

  @ApiProperty({
    description: 'Whether the event was cancelled.',
    example: false,
  })
  readonly isCancelled!: boolean;
}
