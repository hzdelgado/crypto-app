import 'package:bancolombia_test/features/list_crypto/presentation/controller/list_crypto_controller.dart';
import 'package:get/instance_manager.dart';

class ListCryptoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ListCryptoController(),);
  }
 
}