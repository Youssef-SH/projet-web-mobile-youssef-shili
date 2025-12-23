import { ApiProperty } from '@nestjs/swagger';
import { ClubLeaderDto } from '../../../../common/dto/club-leader.dto';

export class ClubLeadersResponseDto {
  @ApiProperty({
    example: 'a7b2cbe0-23e1-4b8a-b8a0-59c42f3c9f7d',
    description: 'Club whose leaders are being retrieved.',
    format: 'uuid',
  })
  readonly clubId!: string;

  @ApiProperty({
    description: 'Exactly two leaders: President and VicePresident.',
    type: [ClubLeaderDto],
    minItems: 2,
    maxItems: 2,
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
  readonly leaders!: ClubLeaderDto[];
}
