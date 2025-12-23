import { ApiPropertyOptional } from '@nestjs/swagger';
import { IsOptional, IsString, MaxLength } from 'class-validator';

export class ApproveEventRequestDto {
  @ApiPropertyOptional({
    description:
      'Optional admin note / justification, stored on the request and shown to the club.',
    example: 'Approved. See you on campus.',
    maxLength: 500,
  })
  @IsOptional()
  @IsString()
  @MaxLength(500)
  comment?: string;
}
