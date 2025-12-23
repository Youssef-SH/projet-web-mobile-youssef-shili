import { ApiProperty } from '@nestjs/swagger';
import { UserRole } from '../../../../common/enums/user-role.enum';

export class MeResponseDto {
  @ApiProperty({
    description: 'Unique identifier of the authenticated user.',
    example: '3f8a9e1b-4d2a-4c6f-8baf-32e6d8e7f1a2',
    format: 'uuid',
  })
  readonly id!: string;

  @ApiProperty({
    description: 'Email address of the authenticated user',
    example: 'student@isimm.tn',
  })
  readonly email!: string;

  @ApiProperty({
    enum: UserRole,
    description: 'Role of the authenticated user within the platform',
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
    format: 'uuid',
  })
  readonly clubId!: string | null;
}
