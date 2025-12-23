import { ApiProperty } from '@nestjs/swagger';

export class AdminRenameClubResponseDto {
  @ApiProperty({
    example: 'a7b2cbe0-23e1-4b8a-b8a0-59c42f3c9f7d',
    description: 'Unique identifier of the club whose name was updated.',
    format: 'uuid',
  })
  readonly id!: string;

  @ApiProperty({
    example: 'IEEE Student Branch ISIMM',
    description: 'New official name of the club after the rename operation.',
  })
  readonly name!: string;
}
