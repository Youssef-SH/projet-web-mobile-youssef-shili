import { ApiProperty } from '@nestjs/swagger';
import { ClubLeaderDto } from '../../../../common/dto/club-leader.dto';

export class UpdateClubLeadersResponseDto {
  @ApiProperty({
    description: 'Leaders after update. Both will have ids now.',
    type: [ClubLeaderDto],
    minItems: 2,
    maxItems: 2,
    example: [
      {
        id: 'f8d2d0b6-2d57-4a6e-9a6e-91acc7a6c6ba',
        role: 'President',
        fullName: 'Alice Mansouri',
        email: 'alice@isimm.tn',
        phone: '22000000',
        cin: '12345678',
        studyLevel: 'ING2',
        specialization: 'GL',
      },
      {
        id: '8b7b6c2d-1f5a-41ba-9b5d-0380d4ce1c0f',
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
