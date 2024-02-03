import { HttpException } from '@nestjs/common';
import { ApiResponse } from './api-error-response.type';

export class ApiHttpException extends HttpException {
  constructor(
    response: {
      field?: string;
      message: string;
    },
    status: number,
  ) {
    super(
      {
        isSuccess: false,
        data: null,
        errors: [{ field: response.field, message: response.message }],
      } as ApiResponse<null>,
      status,
    );
  }
}
