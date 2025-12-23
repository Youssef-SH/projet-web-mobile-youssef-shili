import { ApiPropertyOptional } from '@nestjs/swagger';
import { IsInt, IsOptional, Min, Max } from 'class-validator';
import { Type } from 'class-transformer';

export class GenerateAnnualReportDto {
  @ApiPropertyOptional({
    example: 2025,
    description:
      'Academic year start (e.g. 2025 = 2025–2026). Final allowed range depends on platform launch and current academic year.',
  })
  @IsOptional()
  @Type(() => Number)
  @IsInt({ message: 'Year must be an integer.' })
  @Min(2000, { message: 'Year cannot be before 2000.' })
  @Max(2100, { message: 'Year cannot exceed 2100.' })
  year?: number;
}
