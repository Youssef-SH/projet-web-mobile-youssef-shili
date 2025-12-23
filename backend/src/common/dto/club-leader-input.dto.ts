import {
  IsEnum,
  IsString,
  IsEmail,
  IsNotEmpty,
  MaxLength,
  Matches,
} from 'class-validator';
import { ApiProperty } from '@nestjs/swagger';
import { ClubRole } from '../enums/club-role.enum';
import { StudyLevel } from '../enums/study-level.enum';

export class ClubLeaderInputDto {
  @ApiProperty({ example: 'President', enum: ClubRole })
  @IsEnum(ClubRole)
  role!: ClubRole;

  @ApiProperty({ example: 'Alice Mansouri' })
  @IsString()
  @IsNotEmpty()
  fullName!: string;

  @ApiProperty({ example: 'alice@isimm.tn' })
  @IsEmail()
  email!: string;

  @ApiProperty({ example: '22123456' })
  @IsString()
  @IsNotEmpty()
  @MaxLength(20)
  @Matches(/^[0-9]{8}$/, { message: 'phone must be exactly 8 digits' })
  phone!: string;

  @ApiProperty({ example: '12345678' })
  @IsString()
  @IsNotEmpty()
  @MaxLength(20)
  @Matches(/^[0-9]{8}$/, { message: 'cin must be exactly 8 digits' })
  cin!: string;

  @ApiProperty({ example: 'ING2', enum: StudyLevel })
  @IsEnum(StudyLevel)
  studyLevel!: StudyLevel;

  @ApiProperty({ example: 'GL' })
  @IsString()
  @IsNotEmpty()
  specialization!: string;
}
