import { PipeTransform, UnprocessableEntityException } from '@nestjs/common';
import { ERROR } from '../constants/error-codes';

export class RequiredUploadFilePipe implements PipeTransform {
  constructor(
    private readonly field: string,
    private readonly errorMessage: string,
  ) {}

  transform(file?: Express.Multer.File) {
    if (!file) {
      throw new UnprocessableEntityException({
        code: ERROR.VALIDATION_ERROR,
        message: 'Validation failed',
        error: {
          details: {
            [this.field]: [this.errorMessage],
          },
        },
      });
    }

    return file;
  }
}
