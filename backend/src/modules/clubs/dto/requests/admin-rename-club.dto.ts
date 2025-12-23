import { ApiProperty } from '@nestjs/swagger';
import { IsString, MinLength, MaxLength } from 'class-validator';

export class AdminRenameClubDto {
  @ApiProperty({
    example: 'IEEE Student Branch ISIMM',
    description:
      'The new official name of the club as approved by the administration.',
  })
  @IsString()
  @MinLength(3, { message: 'Club name must be at least 3 characters long' })
  @MaxLength(100, { message: 'Club name cannot exceed 100 characters' })
  name!: string;
}
