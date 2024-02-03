import { User } from 'src/modules/user/persistence/user.entity';
import { Repository } from 'typeorm';
import { Role } from 'src/modules/role/persistence/role.entity';
import { Status } from 'src/modules/status/persistence/status.entity';
export declare class UserSeedService {
    private userRepository;
    private roleRepository;
    private statusRepository;
    constructor(userRepository: Repository<User>, roleRepository: Repository<Role>, statusRepository: Repository<Status>);
    run(): Promise<void>;
}
