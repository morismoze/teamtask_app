import { Repository } from 'typeorm';
import { User } from './user.entity';
export declare class UserRepository extends Repository<User> {
    private readonly userRepository;
    constructor(userRepository: Repository<User>);
}
