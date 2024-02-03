import { Status } from 'src/modules/status/persistence/status.entity';
import { Repository } from 'typeorm';
export declare class StatusSeedService {
    private repository;
    constructor(repository: Repository<Status>);
    run(): Promise<void>;
}
