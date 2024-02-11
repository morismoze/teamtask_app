import 'package:teamtask_app/models/response/api_response.dart';
import 'package:teamtask_app/models/response/user_response_dto.dart';

abstract class UserRepository {
  Future<ApiResponse<UserResponseDto>> me();
}
