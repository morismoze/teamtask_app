import { Strategy } from 'passport-jwt';
import { ConfigService } from '@nestjs/config';
import { AggregatedConfig } from 'src/config/config.model';
import { JwtPayload } from './models/jwt-payload.model';
import { OrNever } from 'src/common/types/or-never.type';
declare const JwtStrategy_base: new (...args: any[]) => Strategy;
export declare class JwtStrategy extends JwtStrategy_base {
    constructor(configService: ConfigService<AggregatedConfig>);
    validate(payload: JwtPayload): OrNever<JwtPayload>;
}
export {};
