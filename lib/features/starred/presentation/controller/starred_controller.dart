import 'dart:async';
import 'package:get/get.dart';
import '../../../list_crypto/domain/entities/crypto_coin.dart';
import '../../../list_crypto/domain/repositories/crypto_coin_repository.dart';

class StarredController extends GetxController {
  RxList<CryptoCoin> paginatedStarredCoins = <CryptoCoin>[].obs;
  final cryptoCoinBox = Get.find<CryptoCoinRepository>();
  StreamController updateStr = StreamController<bool>();

  @override
  void onInit() {
    getCryptoCoins();
    super.onInit();
  }

  /*eventListener() {
    updateStr.stream.listen((e) {
      getCryptoCoins();
    });
  }*/

  getCryptoCoins() async {
    List<CryptoCoin>? coins = cryptoCoinBox.findStarredCryptoCoins();
    if(coins != null) {
      paginatedStarredCoins.clear();
      paginatedStarredCoins.addAll(coins);
    }
  }

}
