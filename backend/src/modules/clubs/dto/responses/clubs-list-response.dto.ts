import { ApiProperty } from '@nestjs/swagger';
import { ClubCardResponseDto } from './club-card-response.dto';

export class ClubsListResponseDto {
  @ApiProperty({
    description:
      'List of all active clubs visible in the directory. Each entry contains minimal public info.',
    type: [ClubCardResponseDto],
    example: [
      {
        id: 'a7b2cbe0-23e1-4b8a-b8a0-59c42f3c9f7d',
        name: 'IEEE ISIMM',
        logoUrl: 'https://supabase.isimm.tn/logos/ieee.png',
      },
      {
        id: 'f4c13b9a-502a-4a61-9d4a-9a11d3a87b34',
        name: 'ARSII ISIMM',
        logoUrl: 'https://supabase.isimm.tn/logos/arsii.png',
      },
    ],
  })
  readonly clubs!: ClubCardResponseDto[];
}
