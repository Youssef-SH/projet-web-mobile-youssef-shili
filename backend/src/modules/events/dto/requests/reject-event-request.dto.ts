import { ApiProperty } from '@nestjs/swagger';
import { IsString, IsNotEmpty, MaxLength } from 'class-validator';

export class RejectEventRequestDto {
  @ApiProperty({
    description:
      'Reason why this event request was rejected. Shown to the club on detail view.',
    example: 'Annex 3 missing signatures.',
    maxLength: 500,
  })
  @IsString()
  @IsNotEmpty()
  @MaxLength(500)
  comment!: string;
}
