import 'package:bancolombia_test/global_widgets/dialog/custom_dialog.dart';
import 'package:get/instance_manager.dart';

import '../features/auth/data/datasources/firebase_auth.dart';

class DependencyInjection {
  static Future<void> init() async {
    Get.lazyPut(() => CustomDialog(), fenix: true);
    Get.lazyPut(() => AuthManager(), fenix: true);
  }
}
