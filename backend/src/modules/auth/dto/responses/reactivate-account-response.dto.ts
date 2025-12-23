import { ApiProperty } from '@nestjs/swagger';
import { InviteType } from '../../entities/enums/invite-type.enum';

export class ReactivateAccountResponseDto {
  @ApiProperty({
    example: 'b3c4c0b2-7b1e-4a6d-9a49-7c9c2b6f2fd1',
    description: 'ID of the reactivated account',
  })
  readonly userId!: string;

  @ApiProperty({
    example: 'new.email@example.com',
    description: 'Email the reactivation link was issued for',
  })
  readonly email!: string;

  @ApiProperty({
    enum: InviteType,
    example: InviteType.STUDENT,
    description: 'Account type derived from the stored role',
  })
  readonly accountType!: InviteType;

  @ApiProperty({
    example: '2025-12-21T12:34:56.000Z',
    description: 'Expiration date/time of the issued reactivation link',
  })
  readonly expiresAt!: Date;
}
