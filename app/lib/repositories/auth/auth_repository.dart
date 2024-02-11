import 'package:teamtask_app/models/response/api_response.dart';
import 'package:teamtask_app/models/request/register_request_dto.dart';
import 'package:teamtask_app/models/response/register_response_dto.dart';

abstract class AuthRepository {
  Future<ApiResponse<RegisterResponseDto>> register(RegisterRequestDto payload);
}
