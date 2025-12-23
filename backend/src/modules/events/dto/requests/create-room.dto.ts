import { ApiProperty } from '@nestjs/swagger';
import { IsString, IsNotEmpty, MaxLength } from 'class-validator';

export class CreateRoomDto {
  @ApiProperty({
    description:
      'Room name as it will appear to clubs when creating an event request.',
    example: 'Amphi A',
    maxLength: 120,
  })
  @IsString()
  @IsNotEmpty()
  @MaxLength(120)
  name!: string;
}
