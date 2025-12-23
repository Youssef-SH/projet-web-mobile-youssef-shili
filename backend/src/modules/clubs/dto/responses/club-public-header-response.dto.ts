import { ApiProperty, ApiPropertyOptional } from '@nestjs/swagger';

export class ClubPublicHeaderResponseDto {
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
    example: 'A student-led community promoting innovation and technology.',
    description:
      'Short description of the club’s mission, goals, and activities.',
  })
  readonly description!: string;

  @ApiProperty({
    example: 'https://supabase.isimm.tn/logos/ieee.png',
    description: 'Publicly accessible URL of the club logo.',
    format: 'uri',
  })
  readonly logoUrl!: string;

  @ApiProperty({
    example: 325,
    description: 'Total number of students currently following this club.',
  })
  readonly followerCount!: number;

  @ApiProperty({
    example: 14,
    description: 'Number of published posts by this club.',
  })
  readonly postCount!: number;

  @ApiPropertyOptional({
    example: true,
    description:
      'Whether the authenticated student follows this club. ' +
      'Included only when the requester is a student.',
  })
  readonly isFollowed?: boolean;

  @ApiPropertyOptional({
    example: true,
    description:
      'Whether this club’s account is currently active. ' +
      'Included only when the requester is an admin.',
  })
  readonly isActive?: boolean;
}
