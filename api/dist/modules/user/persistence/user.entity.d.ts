import { Role } from '../../role/persistence/role.entity';
import { Status } from '../../status/persistence/status.entity';
import { RootBaseEntity } from 'src/common/entity/root-base.entity';
export declare class User extends RootBaseEntity {
    uid: string;
    email: string;
    password: string;
    firstName: string | null;
    lastName: string | null;
    role: Role;
    status: Status;
}
