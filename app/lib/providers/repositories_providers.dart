import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teamtask_app/providers/services_providers.dart';
import 'package:teamtask_app/repositories/auth/auth_repository.dart';
import 'package:teamtask_app/repositories/auth/http_auth_repository.dart';
import 'package:teamtask_app/repositories/user/http_user_repository.dart';
import 'package:teamtask_app/repositories/user/user_repository.dart';

final Provider<AuthRepository> authRepositoryProvider =
    Provider<AuthRepository>(
  (ref) => HttpAuthRepository(
    api: ref.read(dioServiceProvider),
  ),
);

final userRepositoryProvider = Provider<UserRepository>(
  (ref) => HttpUserRepository(
    api: ref.read(dioServiceProvider),
    storageService: ref.read(storageServiceProvider),
  ),
);
