import 'package:teamtask_app/constants/endpoints.dart';
import 'package:teamtask_app/models/response/api_response.dart';
import 'package:teamtask_app/models/response/user_response_dto.dart';
import 'package:teamtask_app/repositories/user/user_repository.dart';
import 'package:teamtask_app/services/api/dio_service.dart';
import 'package:teamtask_app/services/storage/storage_service.dart';

class HttpUserRepository implements UserRepository {
  final DioService api;
  final StorageService storageService;

  HttpUserRepository({
    required this.api,
    required this.storageService,
  });

  @override
  Future<ApiResponse<UserResponseDto>> me() {
    return api.request(
      method: HttpMethod.get,
      url: AppEndpoints.me,
      builder: (response) => ApiResponse.fromJson(
        response,
        (data) => UserResponseDto.fromJson(data),
      ),
    );
  }
}
