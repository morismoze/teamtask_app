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
var __param = (this && this.__param) || function (paramIndex, decorator) {
    return function (target, key) { decorator(target, key, paramIndex); }
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.UserSeedService = void 0;
const common_1 = require("@nestjs/common");
const typeorm_1 = require("@nestjs/typeorm");
const role_enum_1 = require("../../../modules/role/role.enum");
const status_enum_1 = require("../../../modules/status/status.enum");
const user_entity_1 = require("../../../modules/user/persistence/user.entity");
const typeorm_2 = require("typeorm");
const bcrypt = __importStar(require("bcryptjs"));
const uuid_1 = require("uuid");
const role_entity_1 = require("../../../modules/role/persistence/role.entity");
const status_entity_1 = require("../../../modules/status/persistence/status.entity");
let UserSeedService = class UserSeedService {
    constructor(userRepository, roleRepository, statusRepository) {
        this.userRepository = userRepository;
        this.roleRepository = roleRepository;
        this.statusRepository = statusRepository;
    }
    async run() {
        const countAdmin = await this.userRepository.count({
            where: {
                email: 'admin@example.com',
            },
        });
        if (!countAdmin) {
            const salt = await bcrypt.genSalt();
            const password = await bcrypt.hash('secret', salt);
            const adminRole = await this.roleRepository.findOne({
                where: { name: role_enum_1.RoleEnum.admin },
            });
            const activeStatus = await this.statusRepository.findOne({
                where: { name: status_enum_1.StatusEnum.active },
            });
            await this.userRepository.save(this.userRepository.create({
                uid: (0, uuid_1.v4)(),
                firstName: 'Super',
                lastName: 'Admin',
                email: 'admin@example.com',
                password,
                role: adminRole,
                status: activeStatus,
            }));
        }
        const countUser = await this.userRepository.count({
            where: {
                email: 'john.doe@example.com',
            },
        });
        if (!countUser) {
            const salt = await bcrypt.genSalt();
            const password = await bcrypt.hash('secret', salt);
            const userRole = await this.roleRepository.findOne({
                where: { name: role_enum_1.RoleEnum.user },
            });
            const activeStatus = await this.statusRepository.findOne({
                where: { name: status_enum_1.StatusEnum.active },
            });
            await this.userRepository.save(this.userRepository.create({
                uid: (0, uuid_1.v4)(),
                firstName: 'John',
                lastName: 'Doe',
                email: 'john.doe@example.com',
                password,
                role: userRole,
                status: activeStatus,
            }));
        }
    }
};
exports.UserSeedService = UserSeedService;
exports.UserSeedService = UserSeedService = __decorate([
    (0, common_1.Injectable)(),
    __param(0, (0, typeorm_1.InjectRepository)(user_entity_1.User)),
    __param(1, (0, typeorm_1.InjectRepository)(role_entity_1.Role)),
    __param(2, (0, typeorm_1.InjectRepository)(status_entity_1.Status)),
    __metadata("design:paramtypes", [typeorm_2.Repository,
        typeorm_2.Repository,
        typeorm_2.Repository])
], UserSeedService);
//# sourceMappingURL=user-seed.service.js.map