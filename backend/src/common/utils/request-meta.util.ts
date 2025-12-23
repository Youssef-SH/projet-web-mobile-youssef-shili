import type { Request } from 'express';

export function extractRequestMeta(req: Request): {
  userAgent: string | null;
  ipAddress: string | null;
} {
  return {
    userAgent: req.get('user-agent') ?? null,
    ipAddress: req.ip ?? null,
  };
}
