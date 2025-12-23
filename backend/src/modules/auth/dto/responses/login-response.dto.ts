import { ApiProperty } from '@nestjs/swagger';
import { UserRole } from '../../../../common/enums/user-role.enum';

class LoginUserSnapshotDto {
  @ApiProperty({
    description: 'Unique identifier of the authenticated user.',
    example: '7a9b6d14-2b4c-4b1d-8d52-5f91d6e5b8d1',
    format: 'uuid',
  })
  readonly id!: string;

  @ApiProperty({
    description: 'Email address of the authenticated user',
    example: 'user@isimm.tn',
  })
  readonly email!: string;

  @ApiProperty({
    enum: UserRole,
    description: 'Role assigned to the authenticated user',
    example: UserRole.STUDENT,
  })
  readonly role!: UserRole;

  @ApiProperty({
    nullable: true,
    description:
      'Full name of the user (Admin & Student only). Null for club accounts.',
    example: 'Youssef Shili',
  })
  readonly fullName!: string | null;

  @ApiProperty({
    nullable: true,
    description: 'Club ID if the user is a club account, otherwise null',
    example: null,
  })
  readonly clubId!: string | null;
}

export class LoginResponseDto {
  @ApiProperty({
    description: 'JWT access token for authenticated API requests',
    example: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...',
  })
  readonly accessToken!: string;

  @ApiProperty({
    description: 'JWT refresh token used to renew the access token',
    example: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...',
  })
  readonly refreshToken!: string;

  @ApiProperty({
    description: 'Snapshot of the authenticated user',
    type: () => LoginUserSnapshotDto,
  })
  readonly user!: LoginUserSnapshotDto;
}
