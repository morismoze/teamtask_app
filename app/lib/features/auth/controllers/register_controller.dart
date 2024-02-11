import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teamtask_app/models/response/api_response.dart';
import 'package:teamtask_app/models/request/register_request_dto.dart';
import 'package:teamtask_app/models/response/register_response_dto.dart';
import 'package:teamtask_app/models/response/user_response_dto.dart';
import 'package:teamtask_app/providers/repositories_providers.dart';
import 'package:teamtask_app/providers/services_providers.dart';
import 'package:teamtask_app/providers/user_provider.dart';
import 'package:teamtask_app/repositories/auth/auth_repository.dart';
import 'package:teamtask_app/services/storage/storage_service.dart';

final registerControllerProvider = StateNotifierProvider.autoDispose<RegisterController,
    AsyncValue<ApiResponse<RegisterResponseDto>>>(
  (ref) {
    final storageService = ref.read(storageServiceProvider);
    final authRepository = ref.read(authRepositoryProvider);
    
    // What's the purpose of setting all these through the constructor?
    // Woul it be easier to just ref.read the userProvider on need, since it 
    // literally provides riverpod state? Meaning that storageServiceProvider and
    // authRepositoryProvider actually provider some methods and not riverpod state
    return RegisterController(ref, authRepository, storageService, userProvider);
  },
);

class RegisterController
    extends StateNotifier<AsyncValue<ApiResponse<RegisterResponseDto>>> {
  RegisterController(this.ref, this.authRepository, this.storageService, this.userProvider)
      : super(
          AsyncValue.data(
            ApiResponse<RegisterResponseDto>(
              isSuccess: false,
              data: null,
              errors: [],
            ),
          ),
        );

  final Ref ref;
  final AuthRepository authRepository;
  final StorageService storageService;
  final StateNotifierProvider<UserProviderNotifier, UserResponseDto> userProvider;

  Future<void> register(RegisterRequestDto payload) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final response = await authRepository.register(payload);

      storageService.setValue(StorageKeys.token, response.data!.token);
      storageService.setValue(StorageKeys.tokenExpires, response.data!.tokenExpires);
      storageService.setValue(StorageKeys.refreshToken, response.data!.refreshToken);
      ref.read(userProvider.notifier).setUser(response.data!.user);
      - vidjet kako prikazati errore koji su throwani iz tog catcha (tipa validation errors na formi)
      return response;
    });
  }
}
