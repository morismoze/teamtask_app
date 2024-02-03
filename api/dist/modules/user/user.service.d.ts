import { CreateUserDto } from './dto/create-user.dto';
import { Nullable } from '../../common/types/nullable.type';
import { User } from './persistence/user.entity';
import { RoleService } from '../role/role.service';
import { StatusService } from '../status/status.service';
import { UserRepository } from './persistence/user.repository';
import { FindManyOptions, FindOneOptions } from 'typeorm';
import { UserDto } from './dto/user.dto';
export declare class UserService {
    private readonly userRepository;
    private readonly roleService;
    private readonly statusService;
    constructor(userRepository: UserRepository, roleService: RoleService, statusService: StatusService);
    create(createUserDto: CreateUserDto): Promise<User>;
    findOne(fields: FindOneOptions<User>): Promise<Nullable<User>>;
    findAll(fields?: FindManyOptions<User>): Promise<UserDto[]>;
    softDelete(uid: UserDto['uid']): Promise<void>;
}
