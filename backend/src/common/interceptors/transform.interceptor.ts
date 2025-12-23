import {
  Injectable,
  NestInterceptor,
  ExecutionContext,
  CallHandler,
} from '@nestjs/common';
import { Observable } from 'rxjs';
import { map } from 'rxjs/operators';
import { Request, Response } from 'express';
import { ApiResponseDto } from '../dto/api-response.dto';

@Injectable()
export class TransformInterceptor<T>
  implements NestInterceptor<T, ApiResponseDto<T>>
{
  intercept(
    context: ExecutionContext,
    next: CallHandler,
  ): Observable<ApiResponseDto<T>> {
    const httpCtx = context.switchToHttp();
    const req = httpCtx.getRequest<Request>();
    const res = httpCtx.getResponse<Response>();

    return next.handle().pipe(
      map((controllerData: any) => {
        // Already wrapped? Return as-is.
        if (
          controllerData &&
          typeof controllerData === 'object' &&
          'code' in controllerData &&
          'timestamp' in controllerData &&
          'requestId' in controllerData
        ) {
          return controllerData;
        }

        const requestId =
          (req as any).requestId ??
          `req_${Date.now()}_${Math.random().toString(36).slice(2, 8)}`;

        let httpStatus = res.statusCode;

        if (httpStatus === 204) {
          res.status(200);
          httpStatus = 200;
        }

        const responseCode = httpStatus === 201 ? 'CREATED' : 'OK';

        // Optional: handle null/undefined edge case
        if (controllerData === null || controllerData === undefined) {
          return ApiResponseDto.success(
            null,
            'No content',
            responseCode,
            requestId,
          );
        }

        return ApiResponseDto.success(
          controllerData,
          'Operation successful',
          responseCode,
          requestId,
        );
      }),
    );
  }
}
