import { ApiProperty } from '@nestjs/swagger';

export class SubscribeClubResponseDto {
  @ApiProperty({
    example: 'a7b2cbe0-23e1-4b8a-b8a0-59c42f3c9f7d',
    description: 'UUID of the club affected by the follow/unfollow action.',
    format: 'uuid',
  })
  readonly clubId!: string;

  @ApiProperty({
    example: true,
    description: 'Whether the student is now following the club.',
  })
  readonly isFollowed!: boolean;
}
