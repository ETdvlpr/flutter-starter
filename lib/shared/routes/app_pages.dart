import 'package:flutter_app/ui/bindings/auth_binding.dart';
import 'package:flutter_app/ui/pages/auth/auth_page.dart';
import 'package:get/route_manager.dart';

part 'app_routes.dart';

abstract class AppPages {
  static final pages = [
    // Auth Pages
    GetPage(
      name: Routes.auth,
      page: () => const AuthPage(),
      binding: AuthBinding(),
    ),
  ];
}
