import { ApiProperty } from '@nestjs/swagger';
import { UserRole } from '../../../../common/enums/user-role.enum';

class AcceptClubUserDto {
  @ApiProperty({
    description: 'Unique identifier of the newly created club user',
    example: 'b91d12e3-4fa8-4d7f-9c27-1d5b71e6a0cb',
    format: 'uuid',
  })
  readonly id!: string;

  @ApiProperty({
    description: 'Email address associated with the club account',
    example: 'club@isimm.tn',
  })
  readonly email!: string;

  @ApiProperty({
    enum: UserRole,
    description: 'Role assigned to the user (always Club)',
    example: UserRole.CLUB,
  })
  readonly role!: UserRole;

  @ApiProperty({
    nullable: true,
    description: 'Full name for this user — always null for club accounts',
    example: null,
  })
  readonly fullName!: string | null;

  @ApiProperty({
    description: 'Unique identifier of the associated club',
    example: 'c2b8d9e1-9d7a-4f3a-ae11-09b3dffb9b44',
    format: 'uuid',
  })
  readonly clubId!: string;
}

export class AcceptClubResponseDto {
  @ApiProperty({
    description: 'JWT access token for the newly created club session',
    example: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...',
  })
  readonly accessToken!: string;

  @ApiProperty({
    description: 'JWT refresh token for renewing the club session',
    example: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...',
  })
  readonly refreshToken!: string;

  @ApiProperty({
    type: () => AcceptClubUserDto,
    description:
      'Details of the authenticated club user after invite acceptance',
  })
  readonly user!: AcceptClubUserDto;
}
