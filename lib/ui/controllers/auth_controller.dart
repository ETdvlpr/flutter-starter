import 'package:flutter_app/adapters/repository_adapter.dart';
import 'package:flutter_app/data/enums/common_enums.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/state_manager.dart';

class AuthController extends GetxController {
  final IAuthRepository repository;
  AuthController({required this.repository});

  // holds request status
  final status = Status.success.obs;

  void determineNextRoute() async {
    await Future.delayed(const Duration(seconds: 2));
    FlutterNativeSplash.remove();
  }
}
