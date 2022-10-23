import 'package:bancolombia_test/features/starred/presentation/controller/starred_controller.dart';
import 'package:get/instance_manager.dart';

class StarredBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => StarredController(), fenix: true);
  }

}