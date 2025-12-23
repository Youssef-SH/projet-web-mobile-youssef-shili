import {
  ExecutionContext,
  Injectable,
  UnauthorizedException,
  ForbiddenException,
} from '@nestjs/common';
import { AuthGuard } from '@nestjs/passport';
import { ERROR } from '../constants/error-codes';

@Injectable()
export class OptionalJwtAuthGuard extends AuthGuard('jwt') {
  canActivate(context: ExecutionContext) {
    const req = context.switchToHttp().getRequest();
    const header = req.headers?.authorization;
    if (header === undefined) return true;

    const raw = Array.isArray(header) ? header[0] : header;
    if (typeof raw !== 'string') {
      throw new UnauthorizedException({
        code: ERROR.INVALID_TOKEN,
        message: 'Invalid or expired token',
      });
    }

    const trimmed = raw.trim();
    if (!trimmed) {
      throw new UnauthorizedException({
        code: ERROR.INVALID_TOKEN,
        message: 'Invalid or expired token',
      });
    }

    const [scheme, token] = trimmed.split(/\s+/, 2);
    if (!scheme || !token) {
      throw new UnauthorizedException({
        code: ERROR.INVALID_TOKEN,
        message: 'Invalid or expired token',
      });
    }

    if (scheme.toLowerCase() !== 'bearer' || !token.trim()) {
      throw new UnauthorizedException({
        code: ERROR.INVALID_TOKEN,
        message: 'Invalid or expired token',
      });
    }

    return super.canActivate(context);
  }

  handleRequest(err: any, user: any, info: any, context: ExecutionContext) {
    const req = context.switchToHttp().getRequest();

    if (!req.headers?.authorization) {
      return undefined;
    }

    if (info) {
      throw new UnauthorizedException({
        code: ERROR.INVALID_TOKEN,
        message: 'Invalid or expired token',
      });
    }

    if (err || !user) {
      throw new UnauthorizedException({
        code: ERROR.UNAUTHORIZED,
        message: 'Unauthorized',
      });
    }

    if (user.isActive === false) {
      throw new ForbiddenException({
        code: ERROR.ACCOUNT_INACTIVE,
        message: 'Account is inactive',
      });
    }

    return user;
  }
}
