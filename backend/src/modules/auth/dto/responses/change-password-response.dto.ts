import { ApiProperty } from '@nestjs/swagger';

export class ChangePasswordResponseDto {
  @ApiProperty({
    example: true,
    description: 'Indicates whether the password was updated successfully.',
  })
  readonly success!: boolean;

  @ApiProperty({
    example: 'Password updated successfully.',
    description: 'Confirmation message describing the result of the operation.',
  })
  readonly message!: string;
}
