"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.ApiHttpException = void 0;
const common_1 = require("@nestjs/common");
class ApiHttpException extends common_1.HttpException {
    constructor(response, status) {
        super({
            isSuccess: false,
            data: null,
            errors: [{ field: response.field, message: response.message }],
        }, status);
    }
}
exports.ApiHttpException = ApiHttpException;
//# sourceMappingURL=ApiHttpException.model.js.map