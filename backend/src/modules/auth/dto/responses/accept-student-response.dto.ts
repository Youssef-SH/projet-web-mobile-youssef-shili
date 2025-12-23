import { ApiProperty } from '@nestjs/swagger';
import { UserRole } from '../../../../common/enums/user-role.enum';

class AcceptStudentUserDto {
  @ApiProperty({
    description: 'Unique identifier of the newly created student user',
    example: 'a3f5b2d0-8b12-4f6a-9f72-9e1a50dbb8a7',
    format: 'uuid',
  })
  readonly id!: string;

  @ApiProperty({
    description: 'Email address associated with the new student account',
    example: 'student@isimm.tn',
  })
  readonly email!: string;

  @ApiProperty({
    enum: UserRole,
    description: 'Role assigned to the user within the platform',
    example: UserRole.STUDENT,
  })
  readonly role!: UserRole;

  @ApiProperty({
    nullable: true,
    description: 'Full name of the student',
    example: 'Youssef Shili',
  })
  readonly fullName!: string | null;
}

export class AcceptStudentResponseDto {
  @ApiProperty({
    description: 'JWT access token for the new session',
    example: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...',
  })
  readonly accessToken!: string;

  @ApiProperty({
    description: 'JWT refresh token used for session renewal',
    example: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...',
  })
  readonly refreshToken!: string;

  @ApiProperty({
    type: () => AcceptStudentUserDto,
    description: 'Details of the created and authenticated student user',
  })
  readonly user!: AcceptStudentUserDto;
}
