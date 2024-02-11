import 'package:teamtask_app/models/response/user_response_dto.dart';

class LoginResponseDto {
  String token;
  String refreshToken;
  int tokenExpires;
  UserResponseDto user;

  LoginResponseDto({
    required this.token,
    required this.refreshToken,
    required this.tokenExpires,
    required this.user,
  });

  factory LoginResponseDto.fromJson(Map<String, dynamic> json) =>
      LoginResponseDto(
        token: json["token"],
        refreshToken: json["refreshToken"],
        tokenExpires: json["tokenExpires"],
        user: UserResponseDto.fromJson(json["user"]),
      );
}
