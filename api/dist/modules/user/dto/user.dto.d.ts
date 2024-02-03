import { RoleDto } from 'src/modules/role/dto/role.dto';
import { StatusDto } from 'src/modules/status/dto/status.dto';
export declare class UserDto {
    uid: string;
    email: string;
    firstName: string;
    lastName: string;
    role: RoleDto['name'];
    status: StatusDto['name'];
    createdAt: Date;
}
