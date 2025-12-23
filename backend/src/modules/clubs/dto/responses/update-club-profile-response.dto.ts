import { ApiProperty } from '@nestjs/swagger';

export class UpdateClubProfileResponseDto {
  @ApiProperty({
    example: 'A refreshed mission focused on innovation and AI initiatives.',
    description: 'Current public description of the club.',
  })
  readonly description!: string;

  @ApiProperty({
    example:
      'https://supabase.isimm.tn/storage/v1/object/public/clubs/logos/123/xyz.webp',
    description: 'Current public URL of the club logo.',
    format: 'uri',
  })
  readonly logoUrl!: string;
}
