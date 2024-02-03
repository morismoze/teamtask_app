import { Nullable } from 'src/common/types/nullable.type';
import { Status } from './persistence/status.entity';
import { StatusRepository } from './persistence/status.repository';
import { FindOneOptions } from 'typeorm';
export declare class StatusService {
    private readonly statusRepository;
    constructor(statusRepository: StatusRepository);
    findOne(fields: FindOneOptions<Status>): Promise<Nullable<Status>>;
}
