import {
  Inject,
  Injectable,
  PipeTransform,
  Scope,
  UnprocessableEntityException,
} from '@nestjs/common';
import { REQUEST } from '@nestjs/core';
import type { Request } from 'express';

import { ERROR } from '../constants/error-codes';

type UploadRejectDetails = Record<string, string[]>;
type ReqWithUploadReject = Request & {
  __uploadRejectDetails?: UploadRejectDetails;
};

@Injectable({ scope: Scope.REQUEST })
export class OptionalUploadValidationPipe implements PipeTransform {
  constructor(@Inject(REQUEST) private readonly req: ReqWithUploadReject) {}

  transform(file?: Express.Multer.File) {
    if (file) return file;

    const details = this.req.__uploadRejectDetails;
    if (details && Object.keys(details).length > 0) {
      throw new UnprocessableEntityException({
        code: ERROR.VALIDATION_ERROR,
        message: 'Validation failed',
        error: { details },
      });
    }

    return undefined;
  }
}
