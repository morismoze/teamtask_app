import {
  ExceptionFilter,
  Catch,
  ArgumentsHost,
  HttpException,
  HttpStatus,
} from '@nestjs/common';
import { HttpAdapterHost } from '@nestjs/core';
import { ApiResponse } from './api-error-response.type';
import { ApiHttpException } from './ApiHttpException.model';
import { ERROR_CODES } from './error-codes';

@Catch()
export class RootExceptionsFilter implements ExceptionFilter {
  constructor(private readonly httpAdapterHost: HttpAdapterHost) {}

  catch(exception: unknown, host: ArgumentsHost): void {
    const { httpAdapter } = this.httpAdapterHost;
    const ctx = host.switchToHttp();

    if (exception instanceof ApiHttpException) {
      httpAdapter.reply(
        ctx.getResponse(),
        exception.getResponse(),
        exception.getStatus(),
      );
      return;
    }

    const responseBody: ApiResponse<null> = {
      isSuccess: false,
      data: null,
      errors: [
        {
          message: ERROR_CODES.UNEXPECTED_ERROR.message,
        },
      ],
    };

    httpAdapter.reply(
      ctx.getResponse(),
      responseBody,
      HttpStatus.INTERNAL_SERVER_ERROR,
    );
  }
}
