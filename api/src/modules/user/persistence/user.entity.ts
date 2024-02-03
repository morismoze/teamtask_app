import { Column, Entity, Index, JoinColumn, ManyToOne } from 'typeorm';
import { Role } from '../../role/persistence/role.entity';
import { Status } from '../../status/persistence/status.entity';
import { Exclude } from 'class-transformer';
import { RootBaseEntity } from 'src/common/entity/root-base.entity';

@Entity({
  name: 'user',
})
export class User extends RootBaseEntity {
  @Column({ type: String })
  uid: string;

  @Index()
  @Column({ type: String, unique: true })
  email: string;

  @Column()
  @Exclude({ toPlainOnly: true })
  password: string;

  @Index()
  @Column({ type: String, name: 'first_name' })
  firstName: string | null;

  @Index()
  @Column({ type: String, name: 'last_name' })
  lastName: string | null;

  @ManyToOne(() => Role, (role) => role.users, {
    eager: true,
  })
  @JoinColumn({ name: 'role_id', referencedColumnName: 'id' })
  role: Role;

  @ManyToOne(() => Status, (status) => status.users, {
    eager: true,
  })
  @JoinColumn({ name: 'status_id', referencedColumnName: 'id' })
  status: Status;
}
