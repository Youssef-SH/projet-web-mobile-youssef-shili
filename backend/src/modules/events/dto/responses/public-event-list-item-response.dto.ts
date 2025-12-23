import { ApiProperty } from '@nestjs/swagger';

export class PublicEventListItemResponseDto {
  @ApiProperty({
    description: 'Public event identifier.',
    example: 'a5c7de3f-68a2-4e95-8bc0-6c7e47cb2a19',
    format: 'uuid',
  })
  readonly id!: string;

  @ApiProperty({
    description: 'Title of the event.',
    example: 'Web Development Workshop',
  })
  readonly title!: string;

  @ApiProperty({
    description: 'Name of the organizing club.',
    example: 'ARSII',
  })
  readonly clubName!: string;

  @ApiProperty({
    description: 'Start time of the event.',
    example: '2025-10-25T14:00:00Z',
    format: 'date-time',
  })
  readonly startTime!: string;

  @ApiProperty({
    description: 'End time of the event.',
    example: '2025-10-25T16:00:00Z',
    format: 'date-time',
  })
  readonly endTime!: string;

  @ApiProperty({
    description:
      'Location to be displayed to users. Either an internal room name or an external address.',
    example: 'C-11',
  })
  readonly location!: string;

  @ApiProperty({
    description:
      'Whether this event was cancelled. Cancelled events are still returned.',
    example: false,
  })
  readonly isCancelled!: boolean;

  @ApiProperty({
    description: 'Short description to show under the title in calendar/list.',
    example: 'Hands-on React + Nest.js intro',
  })
  readonly description!: string;
}
