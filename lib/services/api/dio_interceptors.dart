import 'dart:developer';
import 'package:dio/dio.dart';

class AuthorizationInterceptor extends InterceptorsWrapper {
  final String accessToken;
  final Dio dio;

  AuthorizationInterceptor(this.dio, this.accessToken);

  @override
  Future onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    try {
      options.headers['Authorization'] = "Bearer $accessToken";
    } catch (e) {
      log('error attaching accessToken : $e');
    }
    return handler.next(options);
  }

  @override
  Future onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) async {
    // Do something with response data
    return handler.next(response); // continue
    // If you want to reject the request with a error message,
    // you can reject a `DioError` object eg: return `dio.reject(dioError)`
  }
}

class RetryInterceptor extends Interceptor {
  int maxRetry;
  final Dio dio;

  RetryInterceptor(this.dio, {this.maxRetry = 3});

  @override
  Future onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.type == DioExceptionType.connectionTimeout ||
        err.type == DioExceptionType.sendTimeout) {
      if (maxRetry > 0) {
        maxRetry--;
        return _retry(err.requestOptions, handler);
      }
    }
    return handler.next(err);
  }

  Future _retry(
      RequestOptions requestOptions, ErrorInterceptorHandler handler) {
    return dio
        .request(
          requestOptions.path,
          cancelToken: requestOptions.cancelToken,
          data: requestOptions.data,
          onReceiveProgress: requestOptions.onReceiveProgress,
          onSendProgress: requestOptions.onSendProgress,
          queryParameters: requestOptions.queryParameters,
          options: Options(method: requestOptions.method),
        )
        .then((value) => handler.resolve(value),
            onError: (e) => handler.reject(e));
  }
}
