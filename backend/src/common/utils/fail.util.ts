import { HttpException, HttpStatus } from '@nestjs/common';
import { ERROR, ErrorCode } from '../constants/error-codes';

export type ErrorDetails = Record<string, any>;

export function fail(
  status: HttpStatus,
  code: ErrorCode,
  message: string,
  details: ErrorDetails = {},
): never {
  throw new HttpException({ code, message, details }, status);
}

// Thin wrappers (remove duplication everywhere)
export const validationError = (
  message = 'Validation failed',
  details: ErrorDetails = {},
): never =>
  fail(
    HttpStatus.UNPROCESSABLE_ENTITY,
    ERROR.VALIDATION_ERROR,
    message,
    details,
  );

export const badRequest = (
  message = 'Bad request',
  details: ErrorDetails = {},
): never => fail(HttpStatus.BAD_REQUEST, ERROR.BAD_REQUEST, message, details);

export const unauthorized = (
  message = 'Unauthorized',
  details: ErrorDetails = {},
): never => fail(HttpStatus.UNAUTHORIZED, ERROR.UNAUTHORIZED, message, details);

export const invalidCredentials = (
  message = 'Invalid credentials',
  details: ErrorDetails = {},
): never =>
  fail(HttpStatus.UNAUTHORIZED, ERROR.INVALID_CREDENTIALS, message, details);

export const invalidToken = (
  message = 'Invalid token',
  details: ErrorDetails = {},
): never =>
  fail(HttpStatus.UNAUTHORIZED, ERROR.INVALID_TOKEN, message, details);

export const accountInactive = (
  message = 'Account inactive',
  details: ErrorDetails = {},
): never =>
  fail(HttpStatus.UNAUTHORIZED, ERROR.ACCOUNT_INACTIVE, message, details);

export const forbidden = (
  message = 'Forbidden',
  details: ErrorDetails = {},
): never => fail(HttpStatus.FORBIDDEN, ERROR.FORBIDDEN, message, details);

export const notFound = (
  message = 'Not found',
  details: ErrorDetails = {},
): never => fail(HttpStatus.NOT_FOUND, ERROR.NOT_FOUND, message, details);

export const conflict = (
  message = 'Conflict',
  details: ErrorDetails = {},
): never => fail(HttpStatus.CONFLICT, ERROR.CONFLICT, message, details);

export const internal = (
  message = 'Internal server error',
  details: ErrorDetails = {},
): never =>
  fail(
    HttpStatus.INTERNAL_SERVER_ERROR,
    ERROR.INTERNAL_ERROR,
    message,
    details,
  );
