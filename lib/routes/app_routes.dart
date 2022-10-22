import 'package:bancolombia_test/features/auth/presentation/pages/auth_page.dart';
import 'package:bancolombia_test/features/home/presentation/binding/home_binding.dart';
import 'package:bancolombia_test/features/home/presentation/pages/home_page.dart';
import 'package:get/get.dart';

import '../features/auth/presentation/binding/auth_binding.dart';
import 'app_pages.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.auth,
      page: () => const AuthPage(),
      binding: AuthBinding(),
      transition: Transition.rightToLeft,
    ),
     GetPage(
      name: AppRoutes.home,
      page: () => const HomePage(),
      binding: HomeBinding(),
      transition: Transition.rightToLeft,
    ),


  ];
}
