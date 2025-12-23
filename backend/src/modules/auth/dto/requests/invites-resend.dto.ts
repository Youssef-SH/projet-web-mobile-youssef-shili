import { IsArray, ArrayNotEmpty, IsEmail } from 'class-validator';
import { ApiProperty } from '@nestjs/swagger';

export class InvitesResendDto {
  @ApiProperty({
    example: ['student1@isimm.tn', 'club@isimm.tn'],
    type: [String],
  })
  @IsArray()
  @ArrayNotEmpty()
  @IsEmail({}, { each: true })
  emails!: string[];
}
