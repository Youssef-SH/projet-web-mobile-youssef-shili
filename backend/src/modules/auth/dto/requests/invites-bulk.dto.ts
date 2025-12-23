import { IsEnum, IsOptional, IsString, IsIn } from 'class-validator';
import { ApiProperty } from '@nestjs/swagger';
import { InviteType } from '../../entities/enums/invite-type.enum';

export class InvitesBulkDto {
  @ApiProperty({ enum: InviteType, example: InviteType.STUDENT })
  @IsEnum(InviteType)
  accountType!: InviteType;

  @ApiProperty({ example: 'replace', enum: ['add', 'replace'] })
  @IsIn(['add', 'replace'])
  mode!: 'add' | 'replace';

  @ApiProperty({ example: 'CONFIRM', required: false })
  @IsString()
  @IsOptional()
  confirm?: string;
}
