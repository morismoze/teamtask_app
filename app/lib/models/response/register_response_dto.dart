import 'package:teamtask_app/models/response/user_response_dto.dart';

class RegisterResponseDto {
  String token;
  String refreshToken;
  int tokenExpires;
  UserResponseDto user;

  RegisterResponseDto({
    required this.token,
    required this.refreshToken,
    required this.tokenExpires,
    required this.user,
  });

  factory RegisterResponseDto.fromJson(Map<String, dynamic> json) =>
      RegisterResponseDto(
        token: json["token"],
        refreshToken: json["refreshToken"],
        tokenExpires: json["tokenExpires"],
        user: UserResponseDto.fromJson(json["user"]),
      );
}
