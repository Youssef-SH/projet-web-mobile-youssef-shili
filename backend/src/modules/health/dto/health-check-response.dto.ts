import { ApiProperty } from '@nestjs/swagger';

export class HealthCheckResponseDto {
  @ApiProperty({
    example: 'ok',
    description: 'Indicates the service status. Always "ok" if healthy.',
  })
  status!: 'ok';

  @ApiProperty({
    example: 1532,
    description: 'Service uptime in seconds since boot.',
  })
  uptime!: number;

  @ApiProperty({
    example: '2025-01-30T12:45:22.120Z',
    description: 'Timestamp (UTC) when the health check was performed.',
  })
  timestamp!: string;
}
