import { ConfigService } from '@nestjs/config';
import { TypeOrmModuleOptions, TypeOrmOptionsFactory } from '@nestjs/typeorm';
import { AggregatedConfig } from 'src/config/config.model';
export declare class TypeOrmConfigService implements TypeOrmOptionsFactory {
    private configService;
    constructor(configService: ConfigService<AggregatedConfig>);
    createTypeOrmOptions(): TypeOrmModuleOptions;
}
