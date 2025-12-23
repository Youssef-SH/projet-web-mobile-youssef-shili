import { ApiProperty } from '@nestjs/swagger';
import { IsBoolean } from 'class-validator';

export class ValidateAnnexDto {
  @ApiProperty({
    description: 'Whether this annex is validated by the admin.',
    example: true,
  })
  @IsBoolean()
  validated!: boolean;
}
