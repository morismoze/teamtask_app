import { ConfigService } from '@nestjs/config';
import { JwtService } from '@nestjs/jwt';
import { AggregatedConfig } from 'src/config/config.model';
import { LoginRequestDto } from './dto/login-request.dto';
import { LoginResponseDto } from './dto/login-response.dto';
import { JwtPayload } from './strategies/models/jwt-payload.model';
import { UserService } from '../user/user.service';
import { UserDto } from '../user/dto/user.dto';
import { RegisterRequestDto } from './dto/register-request.dto';
export declare class AuthService {
    private readonly jwtService;
    private readonly userService;
    private readonly configService;
    constructor(jwtService: JwtService, userService: UserService, configService: ConfigService<AggregatedConfig>);
    register(registerDto: RegisterRequestDto): Promise<LoginResponseDto>;
    login(authDto: LoginRequestDto): Promise<LoginResponseDto>;
    me(userJwtPayload: JwtPayload): Promise<UserDto>;
    refreshToken(data: Omit<JwtPayload, 'role'>): Promise<Omit<LoginResponseDto, 'user'>>;
    private getTokensData;
}
