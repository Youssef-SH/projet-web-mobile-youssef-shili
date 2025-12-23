import { ApiProperty } from '@nestjs/swagger';
import { InviteType } from '../../entities/enums/invite-type.enum';

class InvitesPreviewSummaryDto {
  @ApiProperty({
    enum: InviteType,
    example: InviteType.STUDENT,
    description: 'Type of invite being processed (Student or Club)',
  })
  readonly accountType!: InviteType;

  @ApiProperty({
    enum: ['add', 'replace'],
    example: 'add',
    description: 'Import mode: add new invites or replace existing users',
  })
  readonly mode!: 'add' | 'replace';

  @ApiProperty({
    example: 120,
    description: 'Total number of rows detected in the CSV file',
  })
  readonly totalRows!: number;

  @ApiProperty({
    example: 90,
    description: 'Number of new pending invites that will be created',
  })
  readonly willInviteNew!: number;

  @ApiProperty({
    example: 20,
    description:
      'Number of existing pending invites that will be reissued (token refreshed)',
  })
  readonly willReissuePendingInvite!: number;

  @ApiProperty({
    example: 10,
    description:
      'Number of rows skipped because a user already exists (active or inactive)',
  })
  readonly willSkipExisting!: number;

  @ApiProperty({
    example: 7,
    description:
      'Number of active users that will be deactivated due to replace mode',
  })
  readonly willDeactivate!: number;
}

class InvalidRowDto {
  @ApiProperty({
    example: 15,
    description: 'Row number in the CSV where the error occurred',
  })
  readonly row!: number;

  @ApiProperty({
    example: 'invalid-email@domain',
    description: 'Invalid email value found in the CSV row',
  })
  readonly email!: string;

  @ApiProperty({
    example: 'Invalid email',
    description: 'Reason why the row is considered invalid',
  })
  readonly reason!: string;
}

export class InvitesPreviewResponseDto {
  @ApiProperty({
    type: () => InvitesPreviewSummaryDto,
    description: 'Summary of the CSV import preview',
  })
  readonly summary!: InvitesPreviewSummaryDto;

  @ApiProperty({
    type: [InvalidRowDto],
    description: 'List of invalid CSV rows with validation reasons',
  })
  readonly invalidRows!: InvalidRowDto[];
}
