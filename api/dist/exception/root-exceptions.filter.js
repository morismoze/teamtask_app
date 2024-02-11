"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (this && this.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.RootExceptionsFilter = void 0;
const common_1 = require("@nestjs/common");
const core_1 = require("@nestjs/core");
const ApiHttpException_model_1 = require("./ApiHttpException.model");
const error_codes_1 = require("./error-codes");
let RootExceptionsFilter = class RootExceptionsFilter {
    constructor(httpAdapterHost) {
        this.httpAdapterHost = httpAdapterHost;
    }
    catch(exception, host) {
        const { httpAdapter } = this.httpAdapterHost;
        const ctx = host.switchToHttp();
        if (exception instanceof ApiHttpException_model_1.ApiHttpException) {
            httpAdapter.reply(ctx.getResponse(), exception.getResponse(), exception.getStatus());
            return;
        }
        const responseBody = {
            isSuccess: false,
            data: null,
            errors: [
                {
                    message: error_codes_1.ERROR_CODES.UNEXPECTED_ERROR.message,
                },
            ],
        };
        httpAdapter.reply(ctx.getResponse(), responseBody, common_1.HttpStatus.INTERNAL_SERVER_ERROR);
    }
};
exports.RootExceptionsFilter = RootExceptionsFilter;
exports.RootExceptionsFilter = RootExceptionsFilter = __decorate([
    (0, common_1.Catch)(),
    __metadata("design:paramtypes", [core_1.HttpAdapterHost])
], RootExceptionsFilter);
//# sourceMappingURL=root-exceptions.filter.js.map