import { ApiPropertyOptional } from '@nestjs/swagger';
import { IsOptional, IsUUID, IsEnum } from 'class-validator';

import { PaginationQueryDto } from '../../../../common/dto/pagination-query.dto';
import { RequestStatus } from '../../entities/enums/request-status.enum';

export class AdminEventRequestsQueryDto extends PaginationQueryDto {
  @ApiPropertyOptional({
    description: 'Filter by request status.',
    enum: RequestStatus,
    example: RequestStatus.PENDING,
  })
  @IsOptional()
  @IsEnum(RequestStatus)
  status?: RequestStatus;

  @ApiPropertyOptional({
    description: 'Filter by club (id from /clubs).',
    format: 'uuid',
    example: '3ca4f08b-2ee1-4fd5-b73e-7cb6394e19de',
  })
  @IsOptional()
  @IsUUID('4')
  clubId?: string;
}
