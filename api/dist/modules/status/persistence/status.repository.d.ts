import { Repository } from 'typeorm';
import { Status } from './status.entity';
export declare class StatusRepository extends Repository<Status> {
    private readonly statusRepository;
    constructor(statusRepository: Repository<Status>);
}
