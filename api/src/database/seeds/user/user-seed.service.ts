import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { RoleEnum } from 'src/modules/role/role.enum';
import { StatusEnum } from 'src/modules/status/status.enum';
import { User } from 'src/modules/user/persistence/user.entity';
import { Repository } from 'typeorm';
import * as bcrypt from 'bcryptjs';
import { v4 as uuidv4 } from 'uuid';
import { Role } from 'src/modules/role/persistence/role.entity';
import { Status } from 'src/modules/status/persistence/status.entity';

@Injectable()
export class UserSeedService {
  constructor(
    @InjectRepository(User)
    private userRepository: Repository<User>,
    @InjectRepository(Role)
    private roleRepository: Repository<Role>,
    @InjectRepository(Status)
    private statusRepository: Repository<Status>,
  ) {}

  async run() {
    const countAdmin = await this.userRepository.count({
      where: {
        email: 'admin@example.com',
      },
    });

    if (!countAdmin) {
      const salt = await bcrypt.genSalt();
      const password = await bcrypt.hash('secret', salt);
      const adminRole = await this.roleRepository.findOne({
        where: { name: RoleEnum.admin },
      });
      const activeStatus = await this.statusRepository.findOne({
        where: { name: StatusEnum.active },
      });

      await this.userRepository.save(
        this.userRepository.create({
          uid: uuidv4(),
          firstName: 'Super',
          lastName: 'Admin',
          email: 'admin@example.com',
          password,
          role: adminRole!,
          status: activeStatus!,
        }),
      );
    }

    const countUser = await this.userRepository.count({
      where: {
        email: 'john.doe@example.com',
      },
    });

    if (!countUser) {
      const salt = await bcrypt.genSalt();
      const password = await bcrypt.hash('secret', salt);
      const userRole = await this.roleRepository.findOne({
        where: { name: RoleEnum.user },
      });
      const activeStatus = await this.statusRepository.findOne({
        where: { name: StatusEnum.active },
      });

      await this.userRepository.save(
        this.userRepository.create({
          uid: uuidv4(),
          firstName: 'John',
          lastName: 'Doe',
          email: 'john.doe@example.com',
          password,
          role: userRole!,
          status: activeStatus!,
        }),
      );
    }
  }
}
