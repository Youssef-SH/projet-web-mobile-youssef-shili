import { ApiPropertyOptional } from '@nestjs/swagger';
import { IsOptional, IsString, MinLength, MaxLength } from 'class-validator';

export class UpdateClubProfileDto {
  @ApiPropertyOptional({
    example: 'A refreshed mission focused on innovation and AI initiatives.',
    description:
      'Updated short description summarizing the club’s purpose or new objectives.',
  })
  @IsOptional()
  @IsString()
  @MinLength(10, {
    message: 'Description must be at least 10 characters long.',
  })
  @MaxLength(500, { message: 'Description cannot exceed 500 characters.' })
  description?: string;
}
