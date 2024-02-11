import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teamtask_app/models/response/user_response_dto.dart';

class UserProviderNotifier extends StateNotifier<UserResponseDto> {
  UserProviderNotifier()
      : super(UserResponseDto(
          uid: '',
          email: '',
          firstName: '',
          lastName: '',
          role: '',
          status: '',
          createdAt: DateTime.now(),
        ));

  void setUser(UserResponseDto user) {
    state = user;
  }
}

final userProvider =
    StateNotifierProvider<UserProviderNotifier, UserResponseDto>((ref) {
  return UserProviderNotifier();
});
