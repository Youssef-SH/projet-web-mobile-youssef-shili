import { ApiProperty } from '@nestjs/swagger';
import { RequestStatus } from '../../entities/enums/request-status.enum';

export class CreateEventRequestResponseDto {
  @ApiProperty({
    description: 'Unique identifier of the newly created event request.',
    example: '6d1a9eb3-5f30-4d28-8f46-4496375925b2',
    format: 'uuid',
  })
  readonly id!: string;

  @ApiProperty({
    description: 'Initial status of the request. Always Pending on creation.',
    enum: RequestStatus,
    example: RequestStatus.PENDING,
  })
  readonly status!: RequestStatus;
}
