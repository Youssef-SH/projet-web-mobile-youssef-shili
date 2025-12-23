import { ApiProperty } from '@nestjs/swagger';
import { IsString, MaxLength, MinLength } from 'class-validator';

export class ClubProfileDto {
  @ApiProperty({
    example: 'IEEE ISIMM',
    description: 'Official full name of the club.',
  })
  @IsString()
  @MinLength(3, { message: 'Club name must be at least 3 characters long' })
  @MaxLength(100, { message: 'Club name cannot exceed 100 characters' })
  name!: string;

  @ApiProperty({
    example: 'A student-led community promoting innovation and technology.',
    description: 'Short summary of the club’s purpose and activities.',
  })
  @IsString()
  @MinLength(10, { message: 'Description must be at least 10 characters long' })
  @MaxLength(500, { message: 'Description cannot exceed 500 characters' })
  description!: string;
}
