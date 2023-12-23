import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_app/data/enums/common_enums.dart';
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';

import 'dio_client.dart';
import 'network_exceptions.dart';

class ApiClient {
  late DioClient dioClient;
  final Dio dio;
  Map<String, dynamic> defaultParams = {};

  ApiClient({
    required this.dio,
  }) {
    dioClient = DioClient(dio);
  }

  Future<String?> request({
    RequestType requestType = RequestType.get,
    required String path,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? data,
    bool requiresAuth = true,
  }) async {
    try {
      if (requiresAuth) await dioClient.addAuthorizationInterceptor();

      dynamic response;
      switch (requestType) {
        case RequestType.get:
          response =
              await dioClient.get(path, queryParameters: queryParameters);
          break;
        case RequestType.post:
          response = await dioClient.post(
            path,
            data: data,
            queryParameters: queryParameters,
          );
          break;
        case RequestType.patch:
          response = await dioClient.patch(
            path,
            data: data,
            queryParameters: queryParameters,
          );
          break;
        case RequestType.delete:
          response = await dioClient.delete(
            path,
            data: data,
            queryParameters: queryParameters,
          );
          break;
        case RequestType.put:
          response = await dioClient.put(
            path,
            data: data,
            queryParameters: queryParameters,
          );
          break;
        default:
          throw "Request type not found.";
      }
      return (response is String) ? response : jsonEncode(response);
    } on DioException catch (e) {
      final errorMessage = NetworkExceptions.getErrorMessage(
          NetworkExceptions.getDioException(e));
      var response = e.response?.data;
      if (response == null ||
          (response is String && response.contains("html"))) {
        return Future.error({
          'statusCode': e.response?.statusCode,
          'error': 'Api Error',
          'message': errorMessage,
        });
      }
      return Future.error(
        (response is String) ? jsonDecode(response) : response,
      );
    }
  }

  // sends form data for single or multiple files
  Future<String?> sendFormData({
    required String fileFieldName,
    required Map<String, dynamic> formPayload,
    required String path,
    File? file,
    List<File>? files,
    ProgressCallback? onSendProgress,
    bool requiresAuth = true,
  }) async {
    if (requiresAuth) await dioClient.addAuthorizationInterceptor();

    try {
      // For multiple files case
      if (files?.isNotEmpty ?? false) {
        List<MultipartFile> multipartFiles = [];
        for (File file in files!) {
          String? mimeType = lookupMimeType(file.path);
          List<String> splitMimeTypes = mimeType?.split('/') ?? [];

          final MultipartFile multipartFile = MultipartFile.fromFileSync(
              file.path,
              contentType: MediaType(splitMimeTypes[0], splitMimeTypes[1]));

          multipartFiles.add(multipartFile);
        }

        formPayload[fileFieldName] = multipartFiles;
      } else if (file?.path.isNotEmpty ?? false) {
        // case for single file form data
        String? mimeType = lookupMimeType(file!.path);
        List<String> splitMimeTypes = mimeType?.split('/') ?? [];

        final MultipartFile multipartFile = MultipartFile.fromFileSync(
            file.path,
            contentType: MediaType(splitMimeTypes[0], splitMimeTypes[1]));
        formPayload[fileFieldName] = multipartFile;
      }

      formPayload.addAll(defaultParams);
      log('form payload here: $formPayload');
      var formData = FormData.fromMap(formPayload);

      final response = await dioClient.post(path,
          data: formData, onSendProgress: onSendProgress);
      // Iterable l = json.decode(jsonEncode(response));
      // return List<Files>.from(l.map((model) => Files.fromJson(model)).toList());

      return (response is String) ? response : jsonEncode(response);
    } on DioException catch (e) {
      final errorMessage = NetworkExceptions.getErrorMessage(
          NetworkExceptions.getDioException(e));
      var response = e.response?.data;
      if (response == null ||
          (response is String && response.contains("html"))) {
        return Future.error({
          'statusCode': e.response?.statusCode,
          'error': 'Api Error',
          'message': errorMessage,
        });
      }
      return Future.error(
        (response is String) ? jsonDecode(response) : response,
      );
    }
  }
}
