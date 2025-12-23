import { ApiProperty } from '@nestjs/swagger';
import { IsString, MinLength, Matches, IsNotEmpty } from 'class-validator';

export class AcceptClubScalarsDto {
  @ApiProperty({
    example: 'invite-token-value',
    description: 'Unique invite token sent to the club via email.',
  })
  @IsString()
  @IsNotEmpty()
  token!: string;

  @ApiProperty({
    example: 'StrongPass123!',
    description:
      'Secure password for the new club account. Must contain at least 8 characters, including uppercase, lowercase, and a number.',
  })
  @IsString()
  @MinLength(8, { message: 'Password must be at least 8 characters long' })
  @Matches(/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).+$/, {
    message: 'Password must include uppercase, lowercase, and a number',
  })
  password!: string;
}
