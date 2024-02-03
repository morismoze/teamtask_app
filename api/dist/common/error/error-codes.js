"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.ERROR_CODES = void 0;
exports.ERROR_CODES = {
    UNEXPECTED_ERROR: {
        id: 'UNEXPECTED_ERROR',
        message: 'Something went wrong. Please try again!',
    },
    REGISTRATION_EXISTING_USER: {
        id: 'REGISTRATION_EXISTING_USER',
        message: 'Provided user already exists. Try logging in instead!',
    },
    INVALID_LOGIN: {
        id: 'INVALID_LOGIN',
        message: 'Please check your login credentials and try again.',
    },
    INVALID_ROLE: {
        id: 'INVALID_ROLE',
        message: 'Provided role is invalid',
    },
    INVALID_STATUS: {
        id: 'INVALID_STATUS',
        message: 'Provided status is invalid',
    },
    NON_EXISTING_USER: {
        id: 'NON_EXISTING_USER',
        message: "Provided user doesn't exist",
    },
};
//# sourceMappingURL=error-codes.js.map