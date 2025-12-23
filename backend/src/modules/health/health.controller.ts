import { Controller, Get } from '@nestjs/common';
import { Public } from 'src/common/decorators/public.decorator';
import {
  ApiOperation,
  ApiOkResponse,
  ApiTags,
  getSchemaPath,
} from '@nestjs/swagger';
import { ApiResponseDto } from 'src/common/dto/api-response.dto';
import { HealthCheckResponseDto } from './dto/health-check-response.dto';

@ApiTags('Health')
@Public()
@Controller()
export class HealthController {
  @Get('healthz')
  @ApiOperation({
    summary: 'Service health status check',
    operationId: 'health_check',
    description:
      'Used by uptime monitors, containers, load balancers, and cloud workloads to verify the service is healthy.',
  })
  @ApiOkResponse({
    schema: {
      allOf: [
        { $ref: getSchemaPath(ApiResponseDto) },
        {
          properties: {
            data: { $ref: getSchemaPath(HealthCheckResponseDto) },
          },
        },
      ],
    },
  })
  healthCheck(): ApiResponseDto<HealthCheckResponseDto> {
    return ApiResponseDto.success({
      status: 'ok',
      uptime: Math.floor(process.uptime()),
      timestamp: new Date().toISOString(),
    });
  }
}
