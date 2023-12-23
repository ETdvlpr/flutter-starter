import 'package:dio/dio.dart';
import 'package:flutter_app/adapters/repository_adapter.dart';
import 'package:flutter_app/data/repositories/auth_repository.dart';
import 'package:flutter_app/services/api/api_client.dart';
import 'package:flutter_app/services/firebase_service.dart';
import 'package:flutter_app/ui/controllers/auth_controller.dart';
import 'package:get/get.dart';

/*
  Binding and Dependency injection with lazy initialization for Auth flow,
  using get package
*/
class AuthBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Dio(), fenix: true);
    Get.lazyPut(() => ApiClient(dio: Get.find()), fenix: true);

    Get.lazyPut(() => FirebaseService());
    Get.lazyPut<IAuthRepository>(
        () =>
            AuthRepository(apiClient: Get.find(), firebaseService: Get.find()),
        fenix: true);
    Get.lazyPut(() => AuthController(repository: Get.find()));
  }
}
