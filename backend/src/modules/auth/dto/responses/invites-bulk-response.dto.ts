import { ApiProperty } from '@nestjs/swagger';
import { InviteType } from '../../entities/enums/invite-type.enum';

export class InvitesBulkResponseDto {
  @ApiProperty({
    enum: InviteType,
    example: InviteType.CLUB,
    description: 'Type of invite being processed (Student or Club)',
  })
  readonly accountType!: InviteType;

  @ApiProperty({
    enum: ['add', 'replace'],
    example: 'replace',
    description: 'Import mode: add new invites or replace existing users',
  })
  readonly mode!: 'add' | 'replace';

  @ApiProperty({
    example: 85,
    description: 'Number of new pending invites created (no existing user)',
  })
  readonly invited!: number;

  @ApiProperty({
    example: 12,
    description: 'Number of existing pending invites reissued (token rotated)',
  })
  readonly reissued!: number;

  @ApiProperty({
    example: 10,
    description:
      'Number of emails skipped because a user already exists (active or inactive)',
  })
  readonly skipped!: number;

  @ApiProperty({
    example: 5,
    description: 'Number of active users deactivated due to replace mode',
  })
  readonly deactivated!: number;
}
