import 'package:bancolombia_test/features/list_crypto/data/datasources/coingecko_manager.dart';
import 'package:bancolombia_test/features/list_crypto/domain/entities/crypto_coin.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';

class ListCryptoController extends GetxController {
  RxList<CryptoCoin> cryptoCoins = <CryptoCoin>[].obs;
  final coinGeckoManager = Get.find<CoinGeckoManager>();
  @override
  void onInit() {
    super.onInit();
    getCryptoCoins();
  }

  getCryptoCoins() async {

    var coinList = await coinGeckoManager.getCoinsDetailed();

    print("coinList $coinList");
  }
  
}