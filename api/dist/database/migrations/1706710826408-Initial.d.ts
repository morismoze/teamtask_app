import { MigrationInterface, QueryRunner } from "typeorm";
export declare class Initial1706710826408 implements MigrationInterface {
    name: string;
    up(queryRunner: QueryRunner): Promise<void>;
    down(queryRunner: QueryRunner): Promise<void>;
}
