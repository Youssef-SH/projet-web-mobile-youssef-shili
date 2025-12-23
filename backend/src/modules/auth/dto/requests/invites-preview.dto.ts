import { IsEnum, IsIn } from 'class-validator';
import { ApiProperty } from '@nestjs/swagger';
import { InviteType } from '../../entities/enums/invite-type.enum';

export class InvitesPreviewDto {
  @ApiProperty({ enum: InviteType, example: InviteType.STUDENT })
  @IsEnum(InviteType)
  accountType!: InviteType;

  @ApiProperty({ example: 'replace', enum: ['add', 'replace'] })
  @IsIn(['add', 'replace'])
  mode!: 'add' | 'replace';
}
