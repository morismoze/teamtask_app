"use strict";
var __createBinding = (this && this.__createBinding) || (Object.create ? (function(o, m, k, k2) {
    if (k2 === undefined) k2 = k;
    var desc = Object.getOwnPropertyDescriptor(m, k);
    if (!desc || ("get" in desc ? !m.__esModule : desc.writable || desc.configurable)) {
      desc = { enumerable: true, get: function() { return m[k]; } };
    }
    Object.defineProperty(o, k2, desc);
}) : (function(o, m, k, k2) {
    if (k2 === undefined) k2 = k;
    o[k2] = m[k];
}));
var __setModuleDefault = (this && this.__setModuleDefault) || (Object.create ? (function(o, v) {
    Object.defineProperty(o, "default", { enumerable: true, value: v });
}) : function(o, v) {
    o["default"] = v;
});
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __importStar = (this && this.__importStar) || function (mod) {
    if (mod && mod.__esModule) return mod;
    var result = {};
    if (mod != null) for (var k in mod) if (k !== "default" && Object.prototype.hasOwnProperty.call(mod, k)) __createBinding(result, mod, k);
    __setModuleDefault(result, mod);
    return result;
};
var __metadata = (this && this.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.UserService = void 0;
const common_1 = require("@nestjs/common");
const uuid_1 = require("uuid");
const bcrypt = __importStar(require("bcryptjs"));
const user_entity_1 = require("./persistence/user.entity");
const role_enum_1 = require("../role/role.enum");
const status_enum_1 = require("../status/status.enum");
const role_service_1 = require("../role/role.service");
const status_service_1 = require("../status/status.service");
const user_repository_1 = require("./persistence/user.repository");
const class_transformer_1 = require("class-transformer");
const user_dto_1 = require("./dto/user.dto");
const error_codes_1 = require("../../exception/error-codes");
const ApiHttpException_model_1 = require("../../exception/ApiHttpException.model");
let UserService = class UserService {
    constructor(userRepository, roleService, statusService) {
        this.userRepository = userRepository;
        this.roleService = roleService;
        this.statusService = statusService;
    }
    async create(createUserDto) {
        const user = await this.userRepository.findOne({
            where: {
                email: createUserDto.email,
            },
        });
        if (user) {
            throw new ApiHttpException_model_1.ApiHttpException({
                field: 'email',
                message: error_codes_1.ERROR_CODES.EXISTING_USER.message,
            }, common_1.HttpStatus.UNPROCESSABLE_ENTITY);
        }
        const newUser = new user_entity_1.User();
        newUser.uid = (0, uuid_1.v4)();
        newUser.email = createUserDto.email;
        newUser.firstName = createUserDto.firstName;
        newUser.lastName = createUserDto.lastName;
        const salt = await bcrypt.genSalt();
        newUser.password = await bcrypt.hash(createUserDto.password, salt);
        const role = await this.roleService.findOne({
            where: {
                name: createUserDto.role ? createUserDto.role.name : role_enum_1.RoleEnum.user,
            },
        });
        newUser.role = role;
        const status = await this.statusService.findOne({
            where: {
                name: createUserDto.status
                    ? createUserDto.status.name
                    : status_enum_1.StatusEnum.active,
            },
        });
        newUser.status = status;
        return this.userRepository.save(this.userRepository.create(newUser));
    }
    async findOne(fields) {
        return this.userRepository.findOne(fields);
    }
    async findAll(fields) {
        const users = await this.userRepository.find(fields);
        return (0, class_transformer_1.plainToInstance)(user_dto_1.UserDto, users);
    }
    async softDelete(uid) {
        const user = await this.userRepository.findOne({
            where: {
                uid,
            },
        });
        if (!user) {
            throw new ApiHttpException_model_1.ApiHttpException({
                field: 'uid',
                message: error_codes_1.ERROR_CODES.NON_EXISTING_USER.message,
            }, common_1.HttpStatus.UNPROCESSABLE_ENTITY);
        }
        await this.userRepository.softDelete(uid);
        const inactiveStatus = await this.statusService.findOne({
            where: { name: status_enum_1.StatusEnum.inactive },
        });
        await this.userRepository.update({ uid }, { status: inactiveStatus });
    }
};
exports.UserService = UserService;
exports.UserService = UserService = __decorate([
    (0, common_1.Injectable)(),
    __metadata("design:paramtypes", [user_repository_1.UserRepository,
        role_service_1.RoleService,
        status_service_1.StatusService])
], UserService);
//# sourceMappingURL=user.service.js.map