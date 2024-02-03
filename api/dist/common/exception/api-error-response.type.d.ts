import { ApiError } from './api-error.type';
export type ApiResponse<T> = {
    isSuccess: boolean;
    data: T;
    errors: ApiError[];
};
