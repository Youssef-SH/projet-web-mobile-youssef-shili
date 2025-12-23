import { ApiProperty } from '@nestjs/swagger';
import { RequestStatus } from '../../entities/enums/request-status.enum';
import { PublicEventDetailResponseDto } from './public-event-detail-response.dto';

export class EventRequestApproveResponseDto {
  @ApiProperty({
    description: 'Identifier of the original event request.',
    example: 'b6b00e1e-5baf-4a9b-a460-47b40ff20020',
    format: 'uuid',
  })
  readonly requestId!: string;

  @ApiProperty({
    description: 'Final status of the request after approval.',
    enum: RequestStatus,
    example: RequestStatus.APPROVED,
  })
  readonly requestStatus!: RequestStatus;

  @ApiProperty({
    description: 'Public event created as a result of approving the request.',
    type: () => PublicEventDetailResponseDto,
  })
  readonly event!: PublicEventDetailResponseDto;
}
