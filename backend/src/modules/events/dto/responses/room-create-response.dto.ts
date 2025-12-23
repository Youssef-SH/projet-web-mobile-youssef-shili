import { ApiProperty } from '@nestjs/swagger';

export class RoomCreateResponseDto {
  @ApiProperty({
    description: 'Identifier of the newly created room.',
    example: 'f64c9145-54e9-4d5e-a04b-65928dcbd086',
    format: 'uuid',
  })
  readonly id!: string;

  @ApiProperty({
    description: 'Name of the newly created room.',
    example: 'Amphi C',
  })
  readonly name!: string;
}
