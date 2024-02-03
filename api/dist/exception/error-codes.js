"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.ERROR_CODES = void 0;
exports.ERROR_CODES = {
    UNEXPECTED_ERROR: {
        id: 'UNEXPECTED_ERROR',
        message: 'Something went wrong. Please try again.',
    },
    REQUIRED_FIELD: {
        id: 'EMPTY_FIELD',
        message: 'This field is required.',
    },
    INVALID_CREDENTIALS: {
        id: 'INVALID_CREDENTIALS',
        message: 'Please check your login credentials and try again.',
    },
    INVALID_EMAIL: {
        id: 'INVALID_EMAIL',
        message: 'Provided value is invalid email.',
    },
    INVALID_PASSWORD: {
        id: 'INVALID_PASSWORD',
        message: 'Password should have at least 6 characters.',
    },
    INVALID_ROLE: {
        id: 'INVALID_ROLE',
        message: 'Provided value is invalid role.',
    },
    INVALID_STATUS: {
        id: 'INVALID_STATUS',
        message: 'Provided value is invalid status.',
    },
    NON_EXISTING_USER: {
        id: 'NON_EXISTING_USER',
        message: "Provided user doesn't exist",
    },
    EXISTING_USER: {
        id: 'EXISTING_USER',
        message: 'Provided user already exists. Try logging in instead!',
    },
};
//# sourceMappingURL=error-codes.js.map