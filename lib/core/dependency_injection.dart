
import 'package:bancolombia_test/features/list_crypto/data/datasources/coingecko_api.dart';
import 'package:bancolombia_test/features/list_crypto/data/datasources/coingecko_manager.dart';
import 'package:bancolombia_test/features/list_crypto/domain/repositories/crypto_coin_repository.dart';
import 'package:bancolombia_test/global_widgets/dialog/custom_dialog.dart';
import 'package:get/instance_manager.dart';
import '../features/auth/data/datasources/firebase_auth.dart';
import 'objectbox/objectbox.dart';




class DependencyInjection {
  static Future<void> init() async {
    ObjectBox objectBox = await ObjectBox.create();
    final store = objectBox.store;
    Get.lazyPut(() => ObjectBox(store));
    Get.lazyPut(() => CustomDialog(), fenix: true);
    Get.lazyPut(() => AuthManager(), fenix: true);
    Get.lazyPut(() => CoinGeckoManager(CoinGeckoApi()), fenix: true);
    Get.lazyPut(() => CryptoCoinRepository(), fenix: true);
  }
}
