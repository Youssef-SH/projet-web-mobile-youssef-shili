import { ApiProperty } from '@nestjs/swagger';
import { RequestStatus } from '../../entities/enums/request-status.enum';

export class EventRequestRejectResponseDto {
  @ApiProperty({
    description: 'Identifier of the rejected event request.',
    example: '3f7d7b8f-8a2f-4b0c-9ac0-1cbe59b8247a',
    format: 'uuid',
  })
  readonly id!: string;

  @ApiProperty({
    description: 'Final status of the request after rejection.',
    enum: RequestStatus,
    example: RequestStatus.REJECTED,
  })
  readonly status!: RequestStatus;

  @ApiProperty({
    description: 'Admin comment explaining the rejection. Visible to the club.',
    example: 'Annex 3 missing signatures.',
  })
  readonly adminComment!: string;
}
