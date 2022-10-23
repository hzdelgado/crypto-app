import 'package:bancolombia_test/features/list_crypto/domain/entities/crypto_coin.dart';
import 'package:get/get.dart';

import '../../../../core/objectbox/objectbox.dart';

class CryptoCoinRepository {
  final cryptoCoinBox = Get.find<ObjectBox>().cryptoCoinBox;

  void saveCryptoCoin(CryptoCoin cryptoCoin) {
    try {
      cryptoCoinBox.put(cryptoCoin);
    } catch (err) {
      //TODO
    }
  }

  List<CryptoCoin>? getCryptoCoins() {
    if (cryptoCoinBox.getAll().isEmpty) {
      return null;
    }
    return cryptoCoinBox.getAll();
  }
}
