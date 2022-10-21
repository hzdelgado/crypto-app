import 'package:bancolombia_test/features/auth/presentation/pages/auth_page.dart';
import 'package:get/get.dart';

import '../features/auth/presentation/binding/auth_binding.dart';
import 'app_pages.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.login,
      page: () => const AuthPage(),
      binding: AuthBinding(),
      transition: Transition.rightToLeft,
    ),


  ];
}
