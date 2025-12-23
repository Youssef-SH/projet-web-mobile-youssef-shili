import {
  ExecutionContext,
  Injectable,
  UnauthorizedException,
  ForbiddenException,
} from '@nestjs/common';
import { Reflector } from '@nestjs/core';
import { AuthGuard } from '@nestjs/passport';
import { IS_PUBLIC_KEY } from '../decorators/public.decorator';
import { ERROR } from '../constants/error-codes';

@Injectable()
export class JwtAuthGuard extends AuthGuard('jwt') {
  constructor(private reflector: Reflector) {
    super();
  }

  canActivate(context: ExecutionContext) {
    const isPublic = this.reflector.getAllAndOverride<boolean>(IS_PUBLIC_KEY, [
      context.getHandler(),
      context.getClass(),
    ]);

    if (isPublic) return true;
    return super.canActivate(context);
  }

  handleRequest(err: any, user: any, info: any, context: ExecutionContext) {
    const req = context.switchToHttp().getRequest();

    // No Authorization header at all
    if (!req.headers?.authorization) {
      throw new UnauthorizedException({
        code: ERROR.UNAUTHORIZED,
        message: 'Authorization header missing',
      });
    }

    // JWT present but invalid / expired
    if (info) {
      throw new UnauthorizedException({
        code: ERROR.INVALID_TOKEN,
        message: 'Invalid or expired token',
      });
    }

    // Passport error
    if (err || !user) {
      throw new UnauthorizedException({
        code: ERROR.UNAUTHORIZED,
        message: 'Unauthorized',
      });
    }

    // Business rule
    if (user.isActive === false) {
      throw new ForbiddenException({
        code: ERROR.ACCOUNT_INACTIVE,
        message: 'Account is inactive',
      });
    }

    return user;
  }
}
