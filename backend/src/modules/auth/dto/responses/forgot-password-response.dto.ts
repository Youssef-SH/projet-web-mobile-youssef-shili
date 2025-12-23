import { ApiProperty } from '@nestjs/swagger';

export class ForgotPasswordResponseDto {
  @ApiProperty({
    example: 'If this email exists, a reset link has been sent.',
    description:
      'Non-revealing confirmation message. Always returned, regardless of whether the email is registered.',
  })
  readonly message!: string;
}
