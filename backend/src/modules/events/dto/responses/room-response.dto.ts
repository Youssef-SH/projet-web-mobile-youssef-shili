import { ApiProperty } from '@nestjs/swagger';

export class RoomResponseDto {
  @ApiProperty({
    description: 'Identifier of the room.',
    example: '3f83b50d-7e1c-4ebd-b354-59af5a05a553',
    format: 'uuid',
  })
  readonly id!: string;

  @ApiProperty({
    description: 'Human-readable room name.',
    example: 'Amphi A',
  })
  readonly name!: string;
}
