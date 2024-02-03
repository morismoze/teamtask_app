import { Strategy } from 'passport-jwt';
import { ConfigService } from '@nestjs/config';
import { AggregatedConfig } from 'src/config/config.model';
import { OrNever } from 'src/common/types/or-never.type';
import { JwtPayload } from './models/jwt-payload.model';
declare const JwtRefreshStrategy_base: new (...args: any[]) => Strategy;
export declare class JwtRefreshStrategy extends JwtRefreshStrategy_base {
    constructor(configService: ConfigService<AggregatedConfig>);
    validate(payload: Omit<JwtPayload, 'role'>): OrNever<Omit<JwtPayload, 'role'>>;
}
export {};
