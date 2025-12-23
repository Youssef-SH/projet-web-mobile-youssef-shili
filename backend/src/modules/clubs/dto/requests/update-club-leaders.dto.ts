import { ApiProperty } from '@nestjs/swagger';
import {
  ArrayMinSize,
  ArrayMaxSize,
  ValidateNested,
  IsArray,
} from 'class-validator';
import { Type } from 'class-transformer';
import { ClubLeaderInputDto } from '../../../../common/dto/club-leader-input.dto';

export class UpdateClubLeadersDto {
  @ApiProperty({
    description:
      'List of both club leaders (President and Vice-President). Must contain exactly 2 entries.',
    type: [ClubLeaderInputDto],
    example: [
      {
        role: 'President',
        fullName: 'Alice Mansouri',
        email: 'alice@isimm.tn',
        phone: '22000000',
        cin: '12345678',
        studyLevel: 'ING2',
        specialization: 'GL',
      },
      {
        role: 'VicePresident',
        fullName: 'Bob Ben Ahmed',
        email: 'bob@isimm.tn',
        phone: '23000000',
        cin: '87654321',
        studyLevel: 'ING1',
        specialization: 'INFO',
      },
    ],
  })
  @IsArray()
  @ValidateNested({ each: true })
  @Type(() => ClubLeaderInputDto)
  @ArrayMinSize(2, { message: 'Exactly two leaders are required' })
  @ArrayMaxSize(2, { message: 'Exactly two leaders are required' })
  leaders!: ClubLeaderInputDto[];
}
