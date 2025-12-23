import { ApiProperty, ApiPropertyOptional } from '@nestjs/swagger';
import {
  IsString,
  IsNotEmpty,
  MaxLength,
  IsISO8601,
  IsInt,
  Min,
  IsUUID,
  IsOptional,
  Validate,
  IsEnum,
} from 'class-validator';
import { EventType } from '../../entities/enums/event-type.enum';
import {
  ValidatorConstraint,
  ValidatorConstraintInterface,
  ValidationArguments,
} from 'class-validator';

@ValidatorConstraint({ name: 'RoomOrExternalAddress', async: false })
class RoomOrExternalAddressConstraint implements ValidatorConstraintInterface {
  validate(_: any, args: ValidationArguments): boolean {
    const obj = args.object as any;
    const hasRoom = !!obj.roomId;
    const hasExternal = !!obj.externalAddress;
    return (hasRoom && !hasExternal) || (!hasRoom && hasExternal);
  }

  defaultMessage(): string {
    return 'You must provide either "roomId" or "externalAddress", but not both.';
  }
}

export class CreateEventRequestDto {
  @ApiProperty({
    description: 'Publicly visible title of the event.',
    example: 'AI Day 2025',
    maxLength: 150,
  })
  @IsString()
  @IsNotEmpty()
  @MaxLength(150)
  title!: string;

  @ApiProperty({
    description: 'Detailed description of the event.',
    example: 'Talks + workshops about AI, MLOps, and LLMs.',
    maxLength: 2000,
  })
  @IsString()
  @IsNotEmpty()
  @MaxLength(2000)
  description!: string;

  @ApiProperty({
    description: 'Type / category of this event.',
    enum: EventType,
    example: EventType.SCIENTIFIC,
  })
  @IsEnum(EventType)
  eventType!: EventType;

  @ApiProperty({
    description: 'Start date/time (ISO 8601, UTC recommended).',
    example: '2025-11-18T09:00:00Z',
    format: 'date-time',
  })
  @IsISO8601({ strict: true })
  startTime!: string;

  @ApiProperty({
    description: 'End date/time (must be > startTime, checked in service).',
    example: '2025-11-18T17:00:00Z',
    format: 'date-time',
  })
  @IsISO8601({ strict: true })
  endTime!: string;

  @ApiProperty({
    description: 'Estimated attendance.',
    example: 200,
    minimum: 1,
  })
  @IsInt()
  @Min(1)
  expectedStudents!: number;

  @ApiPropertyOptional({
    description:
      'Internal room ID (on-campus). Mutually exclusive with externalAddress.',
    format: 'uuid',
    example: '9e3f0dd7-2e9d-4d6c-9e3e-2b69b6dfcd02',
  })
  @IsOptional()
  @IsUUID('4')
  roomId?: string;

  @ApiPropertyOptional({
    description:
      'External, off-campus location. Mutually exclusive with roomId.',
    example: 'Hotel Coliseum, Monastir',
    maxLength: 255,
  })
  @IsOptional()
  @IsString()
  @MaxLength(255)
  externalAddress?: string;

  @ApiProperty({
    description:
      'Club leader (President / VicePresident) responsible for this request. Must belong to the authenticated club.',
    format: 'uuid',
    example: '0bce7740-16c4-4e8a-af86-2f7abcd8189b',
  })
  @IsUUID('4')
  submittedBy!: string;

  @Validate(RoomOrExternalAddressConstraint)
  private readonly _locationGuard?: never;
}
