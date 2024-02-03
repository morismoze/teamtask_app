import { Repository } from 'typeorm';
import { Role } from 'src/modules/role/persistence/role.entity';
export declare class RoleRepository extends Repository<Role> {
    private readonly roleRepository;
    constructor(roleRepository: Repository<Role>);
}
