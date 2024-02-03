import { Role } from './persistence/role.entity';
import { Nullable } from 'src/common/types/nullable.type';
import { FindOneOptions } from 'typeorm';
import { RoleRepository } from './persistence/role.repository';
export declare class RoleService {
    private readonly roleRepository;
    constructor(roleRepository: RoleRepository);
    findOne(fields: FindOneOptions<Role>): Promise<Nullable<Role>>;
}
