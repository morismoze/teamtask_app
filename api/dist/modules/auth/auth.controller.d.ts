import { AuthService } from './auth.service';
import { LoginRequestDto } from './dto/login-request.dto';
import { LoginResponseDto } from './dto/login-response.dto';
import { UserDto } from '../user/dto/user.dto';
import { RegisterRequestDto } from './dto/register-request.dto';
export declare class AuthController {
    private readonly authService;
    constructor(authService: AuthService);
    register(registerDto: RegisterRequestDto): Promise<LoginResponseDto>;
    login(loginDto: LoginRequestDto): Promise<LoginResponseDto>;
    me(request: any): Promise<UserDto>;
    refresh(request: any): Promise<Omit<LoginResponseDto, 'user'>>;
}
