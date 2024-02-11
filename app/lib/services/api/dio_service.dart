import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teamtask_app/models/response/login_response_dto.dart';
import 'package:teamtask_app/repositories/auth/auth_repository.dart';
import 'package:teamtask_app/services/storage/storage_service.dart';

import '../../constants/endpoints.dart';
import '../../models/response/api_response.dart';

enum HttpMethod {
  get,
  post,
  patch,
  delete,
  put,
}

class DioService {
  DioService({
    required this.ref,
    required this.storageService,
  }) {
    dio = Dio();
    dio.options.baseUrl = AppEndpoints.baseUrl;
    dio.options.sendTimeout = const Duration(milliseconds: 30000);
    dio.options.connectTimeout = const Duration(milliseconds: 30000);
    dio.options.receiveTimeout = const Duration(milliseconds: 30000);

    dio.interceptors.add(LogInterceptor(
      requestBody: true,
      responseBody: true,
    ));
    dio.interceptors.add(HttpInterceptor(storageService: storageService));
  }

  final ProviderRef ref;
  final StorageService storageService;
  late final Dio dio;

  Future<T> request<T>({
    required String url,
    required HttpMethod method,
    required T Function(dynamic data) builder,
    Map<String, dynamic>? parameters,
    Map<String, dynamic>? payload,
  }) async {
    try {
      dynamic data = payload != null ? jsonEncode(payload) : null;
      final options = Options(
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        method: method.name,
      );

      final Response response;

      switch (method) {
        case HttpMethod.get:
          response = await dio.get(
            url,
            options: options,
            queryParameters: parameters,
          );
          break;
        case HttpMethod.post:
          response = await dio.post(
            url,
            data: data,
            options: options,
          );
          break;
        case HttpMethod.put:
          response = await dio.put(
            url,
            data: data,
            options: options,
          );
          break;
        case HttpMethod.delete:
          response = await dio.delete(
            url,
            data: data,
            options: options,
          );
          break;
        case HttpMethod.patch:
          response = await dio.patch(
            url,
            data: data,
            options: options,
          );
          break;
        default:
          response = await dio.get(
            url,
            options: options,
          );
          break;
      }

      return builder(response.data);
    } on DioException catch (e) {
      throw ApiError(
        message: e.response?.data ?? 'Something unexpected happened',
      );
    } on TypeError catch (e) {
      throw ApiError(message: 'Something unexpected happened');
    }
  }
}

class HttpInterceptor extends Interceptor {
  HttpInterceptor({
    required this.storageService,
  });

  final StorageService storageService;

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final tokenExpires = storageService.getValue(StorageKeys.tokenExpires);
    final currentTimestamp = DateTime.now().millisecondsSinceEpoch;

    if (tokenExpires != null && currentTimestamp > tokenExpires) {
      final tokenDio = Dio();
      final refreshToken = storageService.getValue(StorageKeys.refreshToken);
      final refreshOptions = Options(
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $refreshToken',
        },
      );
      try {
        final response = await tokenDio.post(
          AppEndpoints.refresh,
          options: refreshOptions,
        );
        final newToken = LoginResponseDto.fromJson(response.data);
        options.headers['Authorization'] = newToken;
      } catch (e) {
        // do something
      }
    } else {
      options.headers['Authorization'] =
          storageService.getValue(StorageKeys.token);
    }

    return super.onRequest(options, handler);
  }

  @override
  Future onError(DioException err, ErrorInterceptorHandler handler) async {
    final errorData = err.response?.data as Map<String, dynamic>;

    if (err.message != null &&
        err.message!.contains('Network is unreachable')) {
      // show a snackbar
    }

    switch (err.response?.statusCode) {
      case 401:
        // Navigate to login
        super.onError(err, handler);
      default:
        super.onError(err, handler);
        throw ApiResponse.fromJson(errorData, null);
    }
  }
}
