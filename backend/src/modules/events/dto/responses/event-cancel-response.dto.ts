import { ApiProperty } from '@nestjs/swagger';

export class EventCancelResponseDto {
  @ApiProperty({
    description: 'Identifier of the event that was cancelled.',
    example: 'b9d0de59-ae79-4b52-8032-b94b3e9e4e19',
    format: 'uuid',
  })
  readonly id!: string;

  @ApiProperty({
    description:
      'Whether the event is now in a cancelled state. Always true after this call.',
    example: true,
  })
  readonly isCancelled!: boolean;
}
