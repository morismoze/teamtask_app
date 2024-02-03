import { BaseEntity } from 'typeorm';
export declare abstract class RootBaseEntity extends BaseEntity {
    id: number;
    createdAt: Date;
    updatedAt: Date;
    deletedAt: Date;
}
