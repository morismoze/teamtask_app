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
exports.Status = void 0;
const typeorm_1 = require("typeorm");
const root_base_entity_1 = require("../../../common/entity/root-base.entity");
const user_entity_1 = require("../../user/persistence/user.entity");
const status_enum_1 = require("../status.enum");
let Status = class Status extends root_base_entity_1.RootBaseEntity {
};
exports.Status = Status;
__decorate([
    (0, typeorm_1.Column)({
        type: 'enum',
        enum: status_enum_1.StatusEnum,
        name: 'name',
    }),
    (0, typeorm_1.Index)({
        unique: true,
    }),
    __metadata("design:type", String)
], Status.prototype, "name", void 0);
__decorate([
    (0, typeorm_1.OneToMany)(() => user_entity_1.User, (user) => user.status),
    (0, typeorm_1.JoinColumn)({ referencedColumnName: 'id' }),
    __metadata("design:type", Array)
], Status.prototype, "users", void 0);
exports.Status = Status = __decorate([
    (0, typeorm_1.Entity)({
        name: 'status',
    })
], Status);
//# sourceMappingURL=status.entity.js.map