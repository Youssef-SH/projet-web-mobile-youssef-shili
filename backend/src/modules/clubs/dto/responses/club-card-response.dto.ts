import { ApiProperty } from '@nestjs/swagger';

export class ClubCardResponseDto {
  @ApiProperty({
    example: 'a7b2cbe0-23e1-4b8a-b8a0-59c42f3c9f7d',
    description: 'Unique identifier of the club.',
    format: 'uuid',
  })
  readonly id!: string;

  @ApiProperty({
    example: 'IEEE ISIMM',
    description: 'Official public name of the club.',
  })
  readonly name!: string;

  @ApiProperty({
    example: 'https://supabase.isimm.tn/logos/ieee.png',
    description: 'Publicly accessible URL of the club’s logo.',
    format: 'uri',
  })
  readonly logoUrl!: string;
}
