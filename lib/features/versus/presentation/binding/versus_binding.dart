import 'package:bancolombia_test/features/versus/presentation/controller/versus_controller.dart';
import 'package:get/instance_manager.dart';

class VersusBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => VersusController(), fenix: true);
  }
}
