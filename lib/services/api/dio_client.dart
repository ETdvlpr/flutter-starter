import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter_app/shared/constants.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'dio_interceptors.dart';

class DioClient {
  late Dio _dio;
  final String? baseUrl;
  final List<Interceptor>? interceptors;

  DioClient(
    Dio? dio, {
    this.interceptors,
    this.baseUrl,
  }) {
    _dio = dio ?? Dio();
    (_dio.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () =>
        HttpClient()
          ..badCertificateCallback =
              (X509Certificate cert, String host, int port) => true;

    _dio
      ..options = BaseOptions(
        baseUrl: baseUrl ?? "$kBaseUrl:$kBasePort",
        connectTimeout: const Duration(seconds: kDioConnectTimeout),
        receiveTimeout: const Duration(seconds: kDioReceiveTimeout),
        followRedirects: false,
        // will not throw errors
        // followRedirects: false,
        // validateStatus: (status) {
        //   return status != null ? status < 500 : false;
        // },
      )
      ..httpClientAdapter
      ..options.headers = {'Content-Type': 'application/json; charset=UTF-8'};

    if (interceptors?.isNotEmpty ?? false) {
      _dio.interceptors.addAll(interceptors!);
    }

    // add connectivity retry interceptor
    _dio.interceptors.add(RetryInterceptor(_dio));

    if (kDebugMode) {
      _dio.interceptors.add(LogInterceptor(
        responseBody: true,
        error: true,
        requestHeader: false,
        responseHeader: false,
        request: true,
        requestBody: true,
      ));
    }
  }

  Future<void> addAuthorizationInterceptor() async {
    final accessToken = GetStorage().read('accessToken');

    if (accessToken != null) {
      // Add authorization interceptor if not already added
      final hasAuthInterceptor = _dio.interceptors
          .any((element) => element is AuthorizationInterceptor);
      if (!hasAuthInterceptor) {
        _dio.interceptors.add(AuthorizationInterceptor(_dio, accessToken));
      }
    } else {
      // Remove authorization interceptor if present
      _dio.interceptors
          .removeWhere((element) => element is AuthorizationInterceptor);
    }
  }

  Future<dynamic> get(
    String uri, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      var response = await _dio.get(
        uri,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response.data;
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } on FormatException catch (_) {
      throw FormatException("unable_to_process_the_data".tr);
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> post(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      var response = await _dio.post(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response.data;
    } on FormatException catch (_) {
      throw FormatException("unable_to_process_the_data".tr);
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> patch(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      var response = await _dio.patch(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response.data;
    } on FormatException catch (_) {
      throw FormatException("unable_to_process_the_data".tr);
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> delete(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      var response = await _dio.delete(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return response.data;
    } on FormatException catch (_) {
      throw FormatException("unable_to_process_the_data".tr);
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> put(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      var response = await _dio.put(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response.data;
    } on FormatException catch (_) {
      throw FormatException("unable_to_process_the_data".tr);
    } catch (e) {
      rethrow;
    }
  }
}
