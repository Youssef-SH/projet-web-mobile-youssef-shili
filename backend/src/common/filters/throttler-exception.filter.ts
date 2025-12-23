import {
  ExceptionFilter,
  Catch,
  ArgumentsHost,
  HttpStatus,
} from '@nestjs/common';
import { ThrottlerException } from '@nestjs/throttler';
import { Response, Request } from 'express';
import { ApiResponseDto } from '../dto/api-response.dto';
import { ERROR } from '../constants/error-codes';

@Catch(ThrottlerException)
export class ThrottlerExceptionFilter implements ExceptionFilter {
  catch(_exception: ThrottlerException, host: ArgumentsHost): void {
    const ctx = host.switchToHttp();
    const res = ctx.getResponse<Response>();
    const req = ctx.getRequest<Request>();

    const status = HttpStatus.TOO_MANY_REQUESTS;
    const code = ERROR.RATE_LIMIT_EXCEEDED;
    const message = 'Too many requests. Please wait before retrying.';

    const requestId = (req as any).requestId ?? `req_${Date.now()}`;
    const body = ApiResponseDto.failure(code, message, {}, requestId);

    res.status(status).json(body);
  }
}
