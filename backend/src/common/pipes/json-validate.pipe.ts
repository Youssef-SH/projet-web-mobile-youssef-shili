import { PipeTransform, BadRequestException } from '@nestjs/common';
import { plainToInstance } from 'class-transformer';
import { validateSync } from 'class-validator';
import { ERROR } from 'src/common/constants/error-codes';

export class JsonValidatePipe<T extends object> implements PipeTransform {
  constructor(
    private readonly dto: new () => T,
    private readonly isArray = false,
  ) {}

  transform(value: any) {
    if (typeof value !== 'string') return value;

    let parsed: unknown;
    try {
      parsed = JSON.parse(value);
    } catch {
      throw new BadRequestException({
        code: ERROR.VALIDATION_ERROR,
        message: 'Invalid JSON payload',
      });
    }

    if (this.isArray) {
      if (!Array.isArray(parsed)) {
        throw new BadRequestException({
          code: ERROR.VALIDATION_ERROR,
          message: 'Expected an array payload',
        });
      }

      const instances = parsed.map((item) => plainToInstance(this.dto, item));

      const errors = instances.flatMap((instance) =>
        validateSync(instance, {
          whitelist: true,
          forbidNonWhitelisted: true,
        }),
      );

      if (errors.length) {
        throw new BadRequestException({
          code: ERROR.VALIDATION_ERROR,
          message: 'Validation failed',
          details: errors,
        });
      }

      return instances;
    }

    const instance = plainToInstance(this.dto, parsed);
    const errors = validateSync(instance, {
      whitelist: true,
      forbidNonWhitelisted: true,
    });

    if (errors.length) {
      throw new BadRequestException({
        code: ERROR.VALIDATION_ERROR,
        message: 'Validation failed',
        details: errors,
      });
    }

    return instance;
  }
}
