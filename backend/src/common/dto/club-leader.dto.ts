import { ApiProperty, ApiPropertyOptional } from '@nestjs/swagger';
import { ClubRole } from '../enums/club-role.enum';
import { StudyLevel } from '../enums/study-level.enum';

export class ClubLeaderDto {
  @ApiPropertyOptional({
    description:
      'Leader identifier inside this club. Present in owner-facing endpoints.',
    example: 'f8d2d0b6-2d57-4a6e-9a6e-91acc7a6c6ba',
    format: 'uuid',
  })
  id?: string;

  @ApiProperty({ enum: ClubRole, example: ClubRole.PRESIDENT })
  role!: ClubRole;

  @ApiProperty({ example: 'Alice Mansouri' })
  fullName!: string;

  @ApiProperty({ example: 'alice@isimm.tn' })
  email!: string;

  @ApiProperty({ example: '22000000' })
  phone!: string;

  @ApiProperty({ example: '12345678' })
  cin!: string;

  @ApiProperty({ enum: StudyLevel, example: StudyLevel.ING2 })
  studyLevel!: StudyLevel;

  @ApiProperty({ example: 'GL' })
  specialization!: string;
}
