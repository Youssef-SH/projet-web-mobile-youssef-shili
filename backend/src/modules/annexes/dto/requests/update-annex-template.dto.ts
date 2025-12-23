import { ApiPropertyOptional } from '@nestjs/swagger';
import {
  IsBoolean,
  IsInt,
  IsOptional,
  IsString,
  IsUrl,
  Max,
  Min,
} from 'class-validator';

export class UpdateAnnexTemplateDto {
  @ApiPropertyOptional({
    description: 'New annex number (1..20). Must stay unique.',
    example: 2,
    minimum: 1,
    maximum: 20,
  })
  @IsOptional()
  @IsInt()
  @Min(1)
  @Max(20)
  annexNumber?: number;

  @ApiPropertyOptional({
    description: 'New title for the annex.',
    example: 'Updated Safety Declaration',
  })
  @IsOptional()
  @IsString()
  title?: string;

  @ApiPropertyOptional({
    description: 'New PDF template URL.',
    example:
      'https://cdn.isimm.tn/storage/v1/object/public/templates/annex1_v2.pdf?token=xyz789',
  })
  @IsOptional()
  @IsUrl()
  pdfTemplateUrl?: string;

  @ApiPropertyOptional({
    description: 'Whether this annex is still required.',
    example: false,
  })
  @IsOptional()
  @IsBoolean()
  required?: boolean;

  @ApiPropertyOptional({
    description:
      'Archive/unarchive this template. Archived ones are hidden from UI.',
    example: true,
  })
  @IsOptional()
  @IsBoolean()
  isArchived?: boolean;
}
