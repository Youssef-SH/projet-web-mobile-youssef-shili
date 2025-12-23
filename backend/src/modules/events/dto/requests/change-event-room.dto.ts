import { ApiProperty } from '@nestjs/swagger';
import { IsUUID } from 'class-validator';

export class ChangeEventRoomDto {
  @ApiProperty({
    description: 'Target internal room to move this event to.',
    format: 'uuid',
    example: 'a7f2f5fb-0d9c-4ab3-9a5a-8b8eb956a7ad',
  })
  @IsUUID('4')
  roomId!: string;
}
