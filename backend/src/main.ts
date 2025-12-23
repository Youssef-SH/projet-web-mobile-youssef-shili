import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';

import { ConfigService } from '@nestjs/config';
import { DocumentBuilder, SwaggerModule } from '@nestjs/swagger';
import { ValidationPipe, UnprocessableEntityException } from '@nestjs/common';

import { initializeTransactionalContext } from 'typeorm-transactional';
import * as crypto from 'crypto';

import { ERROR } from './common/constants/error-codes';
import { TransformInterceptor } from './common/interceptors/transform.interceptor';
import { AutoValidateUUIDParamsInterceptor } from './common/interceptors/auto-validate-uuid-params.interceptor';
import { HttpExceptionFilter } from './common/filters/http-exception.filter';
import { ThrottlerExceptionFilter } from './common/filters/throttler-exception.filter';

import type { Request, Response, NextFunction } from 'express';

interface RequestWithId extends Request {
  requestId: string;
}

async function bootstrap(): Promise<void> {
  initializeTransactionalContext();

  const app = await NestFactory.create(AppModule);

  const config = app.get(ConfigService);
  const port = config.get<number>('PORT') ?? 3000;
  const nodeEnv = config.get<string>('NODE_ENV') ?? 'development';

  if (nodeEnv === 'production') {
    const server = app.getHttpAdapter().getInstance() as {
      set: (key: string, value: unknown) => void;
    };
    server.set('trust proxy', 1);
  }

  /**
   * Request ID middleware
   */
  app.use((req: RequestWithId, res: Response, next: NextFunction): void => {
    const incoming = (
      req.headers['x-request-id'] as string | undefined
    )?.trim();

    const requestId =
      incoming && incoming.length <= 128
        ? incoming
        : `req_${crypto.randomUUID()}`;

    req.requestId = requestId;
    res.setHeader('x-request-id', requestId);
    next();
  });

  /**
   * Lightweight request logger
   */
  app.use((req: RequestWithId, _res: Response, next: NextFunction): void => {
    const hasAuth = Boolean(req.headers.authorization);
    console.log(
      `[${req.requestId}] ${req.method} ${req.url}${hasAuth ? ' (Auth)' : ''}`,
    );
    next();
  });

  app.setGlobalPrefix('api/v1');

  app.enableCors({
    origin: true,
    credentials: true,
  });

  /**
   * Global validation → 422
   */
  app.useGlobalPipes(
    new ValidationPipe({
      whitelist: true,
      forbidNonWhitelisted: true,
      transform: true,
      exceptionFactory: (errors) => {
        const details: Record<string, string[]> = {};

        for (const err of errors) {
          details[err.property] = Object.values(err.constraints ?? {});
        }

        return new UnprocessableEntityException({
          code: ERROR.VALIDATION_ERROR,
          message: 'Validation failed',
          details,
        });
      },
    }),
  );

  /**
   * Interceptors
   */
  app.useGlobalInterceptors(
    new AutoValidateUUIDParamsInterceptor(),
    new TransformInterceptor(),
  );

  /**
   * Filters
   */
  app.useGlobalFilters(
    new ThrottlerExceptionFilter(),
    new HttpExceptionFilter(),
  );

  /**
   * Swagger
   */
  const swaggerConfig = new DocumentBuilder()
    .setTitle('ISIMM ClubHub API')
    .setDescription(
      'Official backend API documentation for the ClubHub platform',
    )
    .setVersion('1.0')
    .addBearerAuth()
    .addServer(
      nodeEnv === 'production'
        ? 'https://isimm-clubhub-api.onrender.com'
        : `http://localhost:${port}`,
      nodeEnv === 'production' ? 'Production' : 'Local Development',
    )
    .build();

  const document = SwaggerModule.createDocument(app, swaggerConfig, {
    operationIdFactory: (controllerKey: string, methodKey: string) =>
      `${controllerKey.replace(/Controller$/, '')}_${methodKey}`,
  });

  SwaggerModule.setup('api/docs', app, document);

  await app.listen(port, '0.0.0.0');

  const baseUrl =
    nodeEnv === 'production'
      ? 'https://isimm-clubhub-api.onrender.com'
      : `http://localhost:${port}`;

  console.log(`Server running ➜ ${baseUrl}`);
  console.log(`Swagger ➜ ${baseUrl}/api/docs`);
}

void bootstrap();
