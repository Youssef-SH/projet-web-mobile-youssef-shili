import { ApiProperty } from '@nestjs/swagger';

export class ResetPasswordResponseDto {
  @ApiProperty({
    example: true,
    description: 'Indicates whether the password reset was successful',
  })
  readonly success!: boolean;
}
