import { ApiProperty } from '@nestjs/swagger';
import { IsEmail, IsOptional, IsUUID } from 'class-validator';

export class ReactivateAccountDto {
  @ApiProperty({
    example: 'b3c4c0b2-7b1e-4a6d-9a49-7c9c2b6f2fd1',
    description: 'ID of the inactive account to reactivate',
  })
  @IsUUID()
  readonly userId!: string;

  @ApiProperty({
    example: 'new.email@example.com',
    required: false,
    description:
      'Optional new email to set before issuing the reactivation link',
  })
  @IsOptional()
  @IsEmail()
  readonly newEmail?: string;
}
