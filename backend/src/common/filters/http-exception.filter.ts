import {
  ArgumentsHost,
  Catch,
  ExceptionFilter,
  HttpException,
  HttpStatus,
  Logger,
} from '@nestjs/common';
import { Request, Response } from 'express';
import { ValidationError } from 'class-validator';
import { MulterError } from 'multer';
import { QueryFailedError, EntityNotFoundError } from 'typeorm';

import { ApiResponseDto } from '../dto/api-response.dto';
import { ERROR, ErrorCode } from '../constants/error-codes';
import { observeError } from '../constants/observability/observe-error.util';
import { MAX_UPLOAD_BYTES } from '../../config/upload-limits';

type ErrorBody = {
  code?: unknown;
  message?: unknown;
  details?: unknown;
  statusCode?: unknown;
  error?: unknown;
};

const KNOWN_CODES = new Set<ErrorCode>(Object.values(ERROR));

function isErrorCode(value: unknown): value is ErrorCode {
  return typeof value === 'string' && KNOWN_CODES.has(value as ErrorCode);
}

const STATUS_TO_CODE: Readonly<Record<number, ErrorCode>> = {
  [HttpStatus.UNAUTHORIZED]: ERROR.UNAUTHORIZED,
  [HttpStatus.FORBIDDEN]: ERROR.FORBIDDEN,
  [HttpStatus.NOT_FOUND]: ERROR.NOT_FOUND,
  [HttpStatus.CONFLICT]: ERROR.CONFLICT,
  [HttpStatus.TOO_MANY_REQUESTS]: ERROR.RATE_LIMIT_EXCEEDED,
  [HttpStatus.UNPROCESSABLE_ENTITY]: ERROR.VALIDATION_ERROR,
  [HttpStatus.BAD_REQUEST]: ERROR.BAD_REQUEST,
};

const STATUS_TO_MESSAGE: Readonly<Record<number, string>> = {
  [HttpStatus.UNAUTHORIZED]: 'Unauthorized',
  [HttpStatus.FORBIDDEN]: 'Forbidden',
  [HttpStatus.NOT_FOUND]: 'Not found',
  [HttpStatus.CONFLICT]: 'Conflict',
  [HttpStatus.TOO_MANY_REQUESTS]: 'Too many requests',
  [HttpStatus.UNPROCESSABLE_ENTITY]: 'Validation failed',
  [HttpStatus.BAD_REQUEST]: 'Bad request',
};

@Catch()
export class HttpExceptionFilter implements ExceptionFilter {
  private readonly logger = new Logger(HttpExceptionFilter.name);

  catch(exception: unknown, host: ArgumentsHost) {
    const ctx = host.switchToHttp();
    const res = ctx.getResponse<Response>();
    const req = ctx.getRequest<Request & { requestId?: string }>();

    const requestId = req.requestId ?? `req_${Date.now()}`;

    let status = HttpStatus.INTERNAL_SERVER_ERROR;
    let code: ErrorCode = ERROR.INTERNAL_ERROR;
    let message = 'Internal server error';
    let details: Record<string, unknown> = {};

    if (exception instanceof EntityNotFoundError) {
      return res
        .status(HttpStatus.NOT_FOUND)
        .json(
          ApiResponseDto.failure(ERROR.NOT_FOUND, 'Not found', {}, requestId),
        );
    }

    if (exception instanceof MulterError) {
      if (exception.code === 'LIMIT_FILE_SIZE') {
        const maxMb = (MAX_UPLOAD_BYTES / 1024 / 1024).toFixed(0);
        return res.status(HttpStatus.UNPROCESSABLE_ENTITY).json(
          ApiResponseDto.failure(
            ERROR.VALIDATION_ERROR,
            'Validation failed',
            {
              file: ['Max upload size exceeded'],
              maxMb: [maxMb],
            },
            requestId,
          ),
        );
      }
    }

    if (exception instanceof QueryFailedError) {
      const driver = (exception as { driverError?: unknown }).driverError;

      if (
        typeof driver === 'object' &&
        driver !== null &&
        (driver as { code?: string }).code === '23505'
      ) {
        if (process.env.NODE_ENV !== 'production') {
          details = {
            constraint: (driver as { constraint?: string }).constraint,
            detail: (driver as { detail?: string }).detail,
          };
        }

        return res
          .status(HttpStatus.CONFLICT)
          .json(
            ApiResponseDto.failure(
              ERROR.CONFLICT,
              'Conflict',
              details,
              requestId,
            ),
          );
      }
    }

    if (exception instanceof HttpException) {
      status = exception.getStatus();
      const payload = exception.getResponse();

      const body: ErrorBody =
        typeof payload === 'object' && payload !== null ? payload : {};

      code = isErrorCode(body.code)
        ? body.code
        : (STATUS_TO_CODE[status] ?? ERROR.INTERNAL_ERROR);

      if (Array.isArray(body.message)) {
        status = HttpStatus.UNPROCESSABLE_ENTITY;
        code = ERROR.VALIDATION_ERROR;
        message = 'Validation failed';
        details = this.formatValidationErrors(body.message);
      } else {
        message =
          typeof body.message === 'string'
            ? body.message
            : (STATUS_TO_MESSAGE[status] ?? 'Internal server error');

        const explicitDetails =
          (typeof body.details === 'object' && body.details !== null
            ? body.details
            : undefined) ??
          (typeof body.error === 'object' && body.error !== null
            ? (body.error as { details?: unknown }).details
            : undefined);

        if (typeof explicitDetails === 'object' && explicitDetails !== null) {
          details = explicitDetails as Record<string, unknown>;
        }
      }

      return res
        .status(status)
        .json(ApiResponseDto.failure(code, message, details, requestId));
    }

    this.logger.error(
      `Unhandled exception ${req.method} ${req.originalUrl} [${requestId}]`,
      exception instanceof Error ? exception.stack : String(exception),
    );

    observeError(exception, req, requestId);

    return res
      .status(status)
      .json(ApiResponseDto.failure(code, message, details, requestId));
  }

  private formatValidationErrors(
    messages: string[] | ValidationError[],
  ): Record<string, string[]> {
    const out: Record<string, string[]> = {};

    for (const msg of messages) {
      if (typeof msg === 'string') {
        out.nonField = [...(out.nonField ?? []), msg];
      } else {
        out[msg.property] = Object.values(msg.constraints ?? {});
      }
    }

    return out;
  }
}
