import type { Request } from 'express';

export function observeError(
  error: unknown,
  req: Request,
  requestId: string,
): void {
  // noop by default
  // Example future Sentry integration:
  // Sentry.withScope(scope => {
  //   scope.setTag('requestId', requestId);
  //   scope.setTag('method', req.method);
  //   scope.setTag('url', req.originalUrl);
  //   scope.setExtra('ip', req.ip);
  //   scope.setExtra('userAgent', req.get('user-agent'));
  //   Sentry.captureException(error);
  // });
}
