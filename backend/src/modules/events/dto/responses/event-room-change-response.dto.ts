import { ApiProperty } from '@nestjs/swagger';

export class EventRoomChangeResponseDto {
  @ApiProperty({
    description: 'Identifier of the event whose room has been changed.',
    example: 'b729cd69-7ac1-4c3a-9f70-880dba00e31d',
    format: 'uuid',
  })
  readonly id!: string;

  @ApiProperty({
    description: 'New location/room name to display to users.',
    example: 'Amphi B',
  })
  readonly location!: string;
}
