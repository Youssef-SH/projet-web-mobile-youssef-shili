import { ApiProperty } from '@nestjs/swagger';

export class AnnexViewDto {
  @ApiProperty({
    description: 'Annex template ID this upload is for.',
    format: 'uuid',
    example: '5be0d3a6-4a8e-4cb1-8f2e-4f48325f7f9b',
  })
  readonly annexTemplateId!: string;

  @ApiProperty({
    description: 'Human-readable title of the annex (from template).',
    example: 'Budget prévisionnel',
  })
  readonly title!: string;

  @ApiProperty({
    description: 'URL to access the uploaded annex. Can be public or signed.',
    example:
      'https://cdn.isimm.tn/storage/v1/object/sign/annexes/req-123/5be0d3a6-4a8e.pdf?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9',
  })
  readonly annexUrl!: string | null;

  @ApiProperty({
    description: 'Whether an admin has validated this annex.',
    example: false,
  })
  readonly validated!: boolean;
}
