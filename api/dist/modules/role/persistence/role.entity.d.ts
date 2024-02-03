import { RootBaseEntity } from 'src/common/entity/root-base.entity';
import { User } from 'src/modules/user/persistence/user.entity';
export declare class Role extends RootBaseEntity {
    name: string;
    users: User[];
}
