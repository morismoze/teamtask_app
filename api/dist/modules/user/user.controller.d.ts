import { UserDto } from './dto/user.dto';
import { UserService } from './user.service';
export declare class UserController {
    private readonly userService;
    constructor(userService: UserService);
    all(): Promise<UserDto[]>;
    delete(uid: string): Promise<void>;
}
