import { HttpException } from '@nestjs/common';
export declare class ApiHttpException extends HttpException {
    constructor(response: {
        field?: string;
        message: string;
    }, status: number);
}
