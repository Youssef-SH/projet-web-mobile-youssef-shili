import {
  ApiProperty,
  ApiPropertyOptional,
  ApiExtraModels,
} from '@nestjs/swagger';

import { randomUUID } from 'crypto';

export type ErrorDetails = Record<string, unknown>;

@ApiExtraModels()
export class ResponseErrorDetails {
  @ApiPropertyOptional({
    description: 'Field-level or contextual error details',
    example: {
      email: ['Email format is invalid'],
      password: ['Must contain at least 8 characters'],
    },
  })
  details?: ErrorDetails;
}

@ApiExtraModels(ResponseErrorDetails)
export class ApiResponseDto<T = unknown> {
  @ApiProperty({
    example: 'OK',
    description:
      'Machine-readable status code (e.g. OK, CREATED, VALIDATION_ERROR)',
  })
  code!: string;

  @ApiProperty({
    example: 'Operation successful',
    description: 'Human-readable result summary',
  })
  message!: string;

  @ApiPropertyOptional({
    description: 'Payload for successful operations',
    nullable: true,
  })
  data?: T;

  @ApiPropertyOptional({
    type: () => ResponseErrorDetails,
    description: 'Error details for failed operations',
    nullable: true,
  })
  error?: ResponseErrorDetails;

  @ApiProperty({
    example: 'req_8f2c3a91-3f1e-4e3a-9c2e-91fca9c13c42',
    description: 'Correlation ID for tracing',
  })
  requestId!: string;

  @ApiProperty({
    example: '2025-01-30T12:45:22.120Z',
    description: 'Timestamp (UTC) for the response',
  })
  timestamp!: string;

  constructor(partial: Partial<ApiResponseDto<T>>) {
    Object.assign(this, partial);
  }

  // ─────────── FACTORIES ───────────

  static success<T>(
    data?: T,
    message = 'Operation successful',
    code = 'OK',
    requestId?: string,
  ): ApiResponseDto<T> {
    return new ApiResponseDto<T>({
      code,
      message,
      data,
      requestId: requestId ?? `req_${randomUUID()}`,
      timestamp: new Date().toISOString(),
    });
  }

  static failure(
    code: string,
    message: string,
    errorDetails?: ErrorDetails,
    requestId?: string,
  ): ApiResponseDto<null> {
    return new ApiResponseDto<null>({
      code,
      message,
      error: errorDetails ? { details: errorDetails } : undefined,
      requestId: requestId ?? `req_${randomUUID()}`,
      timestamp: new Date().toISOString(),
    });
  }
}
