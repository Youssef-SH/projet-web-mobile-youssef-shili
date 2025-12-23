import { PaginatedResponseDto } from '../dto/paginated-response.dto';

export interface PaginateParams {
  page: number;
  limit: number;
}

export function buildPaginationResponse<T>(
  items: T[],
  total: number,
  params: PaginateParams,
): PaginatedResponseDto<T> {
  return {
    total,
    page: params.page,
    limit: params.limit,
    totalPages: Math.ceil(total / params.limit),
    data: items,
  };
}
