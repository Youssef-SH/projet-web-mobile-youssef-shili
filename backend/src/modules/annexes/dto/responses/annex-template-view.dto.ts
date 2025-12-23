import { ApiProperty } from '@nestjs/swagger';

export class AnnexTemplateViewDto {
  @ApiProperty({
    description: 'Annex template unique identifier.',
    format: 'uuid',
    example: '49a5d558-5a20-4b96-a41a-8e3b3397a3c7',
  })
  readonly id!: string;

  @ApiProperty({
    description: 'Order/display number of the annex.',
    example: 1,
  })
  readonly annexNumber!: number;

  @ApiProperty({
    description: 'Human-readable title of the annex.',
    example: 'Safety Declaration',
  })
  readonly title!: string;

  @ApiProperty({
    description: 'URL to the PDF template (could be a signed URL).',
    example:
      'https://cdn.isimm.tn/storage/v1/object/public/templates/annex1.pdf?token=abc123',
  })
  readonly pdfTemplateUrl!: string;

  @ApiProperty({
    description: 'Whether this annex is required for event requests.',
    example: true,
  })
  readonly required!: boolean;

  @ApiProperty({
    description: 'Whether this annex template is archived (soft-deleted).',
    example: false,
  })
  readonly isArchived!: boolean;
}
