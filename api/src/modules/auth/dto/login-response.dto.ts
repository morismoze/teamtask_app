import { UserDto } from 'src/modules/user/dto/user.dto';

export type LoginResponseDto = {
  token: string;
  refreshToken: string;
  tokenExpires: number;
  user: UserDto;
};
