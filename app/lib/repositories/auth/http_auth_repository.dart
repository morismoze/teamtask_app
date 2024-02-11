import 'package:teamtask_app/constants/endpoints.dart';
import 'package:teamtask_app/models/response/api_response.dart';
import 'package:teamtask_app/models/request/register_request_dto.dart';
import 'package:teamtask_app/models/response/register_response_dto.dart';
import 'package:teamtask_app/repositories/auth/auth_repository.dart';
import 'package:teamtask_app/services/api/dio_service.dart';

class HttpAuthRepository implements AuthRepository {
  final DioService api;

  HttpAuthRepository({
    required this.api,
  });

  @override
  Future<ApiResponse<RegisterResponseDto>> register(
      RegisterRequestDto payload) {
    return api.request(
      method: HttpMethod.post,
      url: AppEndpoints.register,
      builder: (response) => ApiResponse.fromJson(
        response,
        (data) => RegisterResponseDto.fromJson(data),
      ),
      payload: payload.toJson(),
    );
  }
}
