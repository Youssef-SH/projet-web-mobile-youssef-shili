import { ApiProperty } from '@nestjs/swagger';

export class InvitesResendResponseDto {
  @ApiProperty({
    description: 'Total number of emails requested for resend',
    example: 50,
  })
  readonly requested!: number;

  @ApiProperty({
    description: 'Number of pending invites successfully resent',
    example: 42,
  })
  readonly resent!: number;

  @ApiProperty({
    description: 'Emails skipped because no pending invite exists',
    example: 5,
  })
  readonly skipped!: number;

  @ApiProperty({
    description: 'Invites that failed to resend due to errors',
    example: 3,
  })
  readonly failed!: number;
}
