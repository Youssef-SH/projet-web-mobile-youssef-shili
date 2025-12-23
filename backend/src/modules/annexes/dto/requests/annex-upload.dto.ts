import { ApiProperty } from '@nestjs/swagger';
import { IsUUID } from 'class-validator';

export class AnnexUploadDto {
  @ApiProperty({
    description: 'Annex template this file corresponds to.',
    format: 'uuid',
    example: '5be0d3a6-4a8e-4cb1-8f2e-4f48325f7f9b',
  })
  @IsUUID('4')
  annexTemplateId!: string;
}
