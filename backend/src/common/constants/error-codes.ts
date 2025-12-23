export const ERROR = {
  // Validation / request shape
  VALIDATION_ERROR: 'VALIDATION_ERROR',
  BAD_REQUEST: 'BAD_REQUEST',

  // Auth
  UNAUTHORIZED: 'UNAUTHORIZED', // generic 401 (missing auth header, etc.)
  INVALID_CREDENTIALS: 'INVALID_CREDENTIALS', // login failure
  INVALID_TOKEN: 'INVALID_TOKEN', // JWT invalid/expired
  ACCOUNT_INACTIVE: 'ACCOUNT_INACTIVE', // still 401 in your contract if you want

  // Access
  FORBIDDEN: 'FORBIDDEN',

  // Domain / routing
  NOT_FOUND: 'NOT_FOUND',
  CONFLICT: 'CONFLICT',

  // Rate limiting
  RATE_LIMIT_EXCEEDED: 'RATE_LIMIT_EXCEEDED',

  // Catch-all
  INTERNAL_ERROR: 'INTERNAL_ERROR',
} as const;

export type ErrorCode = (typeof ERROR)[keyof typeof ERROR];
