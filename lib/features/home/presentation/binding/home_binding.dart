import 'package:bancolombia_test/features/list_crypto/presentation/controller/list_crypto_controller.dart';
import 'package:get/get.dart';

import '../controller/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }
}