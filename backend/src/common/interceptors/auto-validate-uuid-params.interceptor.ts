import {
  Injectable,
  NestInterceptor,
  ExecutionContext,
  CallHandler,
  UnprocessableEntityException,
} from '@nestjs/common';
import { Observable } from 'rxjs';
import { validate as uuidValidate, version as uuidVersion } from 'uuid';
import { ERROR } from '../constants/error-codes';

@Injectable()
export class AutoValidateUUIDParamsInterceptor implements NestInterceptor {
  private readonly idLikeParamRegex = /(id|Id|ID)$/;

  intercept(context: ExecutionContext, next: CallHandler): Observable<any> {
    const req = context.switchToHttp().getRequest();
    const params = req.params ?? {};

    for (const [key, value] of Object.entries(params)) {
      if (typeof value !== 'string') continue;
      if (!this.idLikeParamRegex.test(key)) continue;

      const isUUIDv4 = uuidValidate(value) && uuidVersion(value) === 4;
      if (!isUUIDv4) {
        throw new UnprocessableEntityException({
          code: ERROR.VALIDATION_ERROR,
          message: `Invalid UUID format for parameter "${key}"`,
          details: { [key]: [`"${value}" is not a valid UUID v4`] },
        });
      }
    }

    return next.handle();
  }
}
