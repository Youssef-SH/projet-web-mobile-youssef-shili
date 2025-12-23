import { ApiProperty } from '@nestjs/swagger';
import { IsBoolean, IsInt, IsString, IsUrl, Max, Min } from 'class-validator';

export class CreateAnnexTemplateDto {
  @ApiProperty({
    description: 'Display/order number of the annex (1..20). Must be unique.',
    example: 1,
    minimum: 1,
    maximum: 20,
  })
  @IsInt()
  @Min(1)
  @Max(20)
  annexNumber!: number;

  @ApiProperty({
    description: 'Human-readable title of the annex.',
    example: 'Safety Declaration',
  })
  @IsString()
  title!: string;

  @ApiProperty({
    description:
      'URL (usually Supabase/S3) to the PDF template to download/fill.',
    example:
      'https://cdn.isimm.tn/storage/v1/object/public/templates/annex1.pdf?token=abc123',
  })
  @IsUrl()
  pdfTemplateUrl!: string;

  @ApiProperty({
    description:
      'Whether this annex is required when creating an event request.',
    example: true,
    default: true,
  })
  @IsBoolean()
  required!: boolean;
}
