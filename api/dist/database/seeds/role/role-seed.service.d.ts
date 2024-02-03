import { Role } from 'src/modules/role/persistence/role.entity';
import { Repository } from 'typeorm';
export declare class RoleSeedService {
    private repository;
    constructor(repository: Repository<Role>);
    run(): Promise<void>;
}
