import { ApiProperty } from '@nestjs/swagger';
import { ClubLeaderDto } from '../../../../common/dto/club-leader.dto';

export class ClubSelfProfileResponseDto {
  @ApiProperty({
    example: 'a7b2cbe0-23e1-4b8a-b8a0-59c42f3c9f7d',
    description: 'Authenticated club id.',
    format: 'uuid',
  })
  readonly id!: string;

  @ApiProperty({ example: 'IEEE ISIMM' })
  readonly name!: string;

  @ApiProperty({
    example: 'Tech community and innovation',
  })
  readonly description!: string;

  @ApiProperty({
    example: 'https://supabase.isimm.tn/logos/ieee.png',
  })
  readonly logoUrl!: string;

  @ApiProperty({
    description: 'Current leaders for this club. Here we DO include ids.',
    type: [ClubLeaderDto],
    minItems: 2,
    maxItems: 2,
    example: [
      {
        id: 'f8d2d0b6-2d57-4a6e-9a6e-91acc7a6c6ba',
        role: 'President',
        fullName: 'Alice Mansouri',
        email: 'alice@isimm.tn',
        phone: '22000000',
        cin: '12345678',
        studyLevel: 'ING2',
        specialization: 'GL',
      },
      {
        id: '8b7b6c2d-1f5a-41ba-9b5d-0380d4ce1c0f',
        role: 'VicePresident',
        fullName: 'Bob Ben Ahmed',
        email: 'bob@isimm.tn',
        phone: '23000000',
        cin: '87654321',
        studyLevel: 'ING1',
        specialization: 'INFO',
      },
    ],
  })
  readonly leaders!: ClubLeaderDto[];

  @ApiProperty({
    example: 2024,
    description:
      'Earliest academic year start available for reports for this club (AY start year).',
  })
  readonly minReportAyStart!: number;

  @ApiProperty({
    example: 2025,
    description: 'Current academic year start (AY start year).',
  })
  readonly currentAyStart!: number;
}
