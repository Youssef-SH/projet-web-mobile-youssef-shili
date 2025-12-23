import { ApiProperty } from '@nestjs/swagger';

export class EventRescheduleResponseDto {
  @ApiProperty({
    description: 'Identifier of the rescheduled event.',
    example: '5c6e9863-3509-4f7e-9ce5-f99e772a60d2',
    format: 'uuid',
  })
  readonly id!: string;

  @ApiProperty({
    description: 'New start time for the event.',
    example: '2025-11-19T09:00:00Z',
    format: 'date-time',
  })
  readonly startTime!: string;

  @ApiProperty({
    description: 'New end time for the event.',
    example: '2025-11-19T17:00:00Z',
    format: 'date-time',
  })
  readonly endTime!: string;
}
