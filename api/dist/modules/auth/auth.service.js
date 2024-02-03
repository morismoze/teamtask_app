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
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.AuthService = void 0;
const common_1 = require("@nestjs/common");
const config_1 = require("@nestjs/config");
const jwt_1 = require("@nestjs/jwt");
const ms_1 = __importDefault(require("ms"));
const bcryptjs_1 = __importDefault(require("bcryptjs"));
const user_service_1 = require("../user/user.service");
const user_dto_1 = require("../user/dto/user.dto");
const status_enum_1 = require("../status/status.enum");
const class_transformer_1 = require("class-transformer");
const role_enum_1 = require("../role/role.enum");
const error_codes_1 = require("../../exception/error-codes");
const ApiHttpException_model_1 = require("../../exception/ApiHttpException.model");
let AuthService = class AuthService {
    constructor(jwtService, userService, configService) {
        this.jwtService = jwtService;
        this.userService = userService;
        this.configService = configService;
    }
    async register(registerDto) {
        const createdUser = await this.userService.create({
            ...registerDto,
            role: {
                name: role_enum_1.RoleEnum.user,
            },
            status: {
                name: status_enum_1.StatusEnum.active,
            },
        });
        const { token, refreshToken, tokenExpires } = await this.getTokensData({
            uid: createdUser.uid,
            role: createdUser.role,
        });
        return {
            token,
            refreshToken,
            tokenExpires,
            user: (0, class_transformer_1.plainToInstance)(user_dto_1.UserDto, createdUser),
        };
    }
    async login(authDto) {
        const user = await this.userService.findOne({
            where: {
                email: authDto.email,
            },
        });
        if (!user) {
            throw new ApiHttpException_model_1.ApiHttpException({
                field: 'email',
                message: error_codes_1.ERROR_CODES.INVALID_CREDENTIALS.message,
            }, common_1.HttpStatus.UNPROCESSABLE_ENTITY);
        }
        if (user.status.name === status_enum_1.StatusEnum.inactive) {
            throw new ApiHttpException_model_1.ApiHttpException({
                field: 'status',
                message: error_codes_1.ERROR_CODES.INVALID_CREDENTIALS.message,
            }, common_1.HttpStatus.UNPROCESSABLE_ENTITY);
        }
        const isValidPassword = await bcryptjs_1.default.compare(authDto.password, user.password);
        if (!isValidPassword) {
            throw new ApiHttpException_model_1.ApiHttpException({
                field: 'password',
                message: error_codes_1.ERROR_CODES.INVALID_CREDENTIALS.message,
            }, common_1.HttpStatus.UNPROCESSABLE_ENTITY);
        }
        const { token, refreshToken, tokenExpires } = await this.getTokensData({
            uid: user.uid,
            role: user.role,
        });
        return {
            refreshToken,
            token,
            tokenExpires,
            user: (0, class_transformer_1.plainToInstance)(user_dto_1.UserDto, user),
        };
    }
    async me(userJwtPayload) {
        const user = this.userService.findOne({
            where: {
                uid: userJwtPayload.sub,
            },
        });
        return (0, class_transformer_1.plainToInstance)(user_dto_1.UserDto, user);
    }
    async refreshToken(data) {
        const user = await this.userService.findOne({
            where: {
                uid: data.sub,
            },
        });
        const { token, refreshToken, tokenExpires } = await this.getTokensData({
            uid: user.uid,
            role: user.role,
        });
        return {
            token,
            refreshToken,
            tokenExpires,
        };
    }
    async getTokensData(data) {
        const tokenExpiresIn = this.configService.getOrThrow('auth.expires', {
            infer: true,
        });
        const refreshTokenExpiresIn = this.configService.getOrThrow('auth.refreshExpires', {
            infer: true,
        });
        const tokenExpires = Date.now() + (0, ms_1.default)(tokenExpiresIn);
        const refreshTokenExpires = Date.now() + (0, ms_1.default)(refreshTokenExpiresIn);
        const [token, refreshToken] = await Promise.all([
            await this.jwtService.signAsync({
                sub: data.uid,
                role: data.role,
            }, {
                secret: this.configService.getOrThrow('auth.secret', { infer: true }),
                expiresIn: tokenExpiresIn,
            }),
            await this.jwtService.signAsync({
                sub: data.uid,
            }, {
                secret: this.configService.getOrThrow('auth.refreshSecret', {
                    infer: true,
                }),
                expiresIn: refreshTokenExpires,
            }),
        ]);
        return {
            token,
            refreshToken,
            tokenExpires,
        };
    }
};
exports.AuthService = AuthService;
exports.AuthService = AuthService = __decorate([
    (0, common_1.Injectable)(),
    __metadata("design:paramtypes", [jwt_1.JwtService,
        user_service_1.UserService,
        config_1.ConfigService])
], AuthService);
//# sourceMappingURL=auth.service.js.map