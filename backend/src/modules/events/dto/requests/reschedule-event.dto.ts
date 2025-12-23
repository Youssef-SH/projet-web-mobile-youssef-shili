import { ApiProperty } from '@nestjs/swagger';
import { IsISO8601 } from 'class-validator';

export class RescheduleEventDto {
  @ApiProperty({
    description: 'New event start datetime (ISO 8601).',
    example: '2025-11-19T09:00:00Z',
    format: 'date-time',
  })
  @IsISO8601({ strict: true })
  startTime!: string;

  @ApiProperty({
    description:
      'New event end datetime (ISO 8601). Must be > startTime (service will check).',
    example: '2025-11-19T17:00:00Z',
    format: 'date-time',
  })
  @IsISO8601({ strict: true })
  endTime!: string;
}
