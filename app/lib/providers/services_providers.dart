import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teamtask_app/services/api/dio_service.dart';
import 'package:teamtask_app/services/storage/hive_storage_service.dart';
import 'package:teamtask_app/services/storage/storage_service.dart';

final storageServiceProvider =
    Provider<StorageService>((_) => HiveStorageService());

final Provider<DioService> dioServiceProvider = Provider<DioService>(
  (ref) => DioService(
    ref: ref,
    storageService: ref.read(storageServiceProvider),
  ),
);
