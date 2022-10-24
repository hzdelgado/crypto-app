import 'package:bancolombia_test/features/list_crypto/domain/entities/crypto_coin.dart';
import 'package:bancolombia_test/objectbox.g.dart';
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

  CryptoCoin? getCryptoCoinById(String id) {
    final query = cryptoCoinBox.query(CryptoCoin_.id.equals(id)).build();
    final coins = query.find();
    query.close();
    if (coins.isNotEmpty) {
      return coins.first;
    }
    return null;
  }

  void saveCryptoCoins(List<CryptoCoin> cryptoCoins) {
    List<CryptoCoin> current = getCryptoCoins() ?? [];
    List<CryptoCoin> newCoins = [];
   
    for (var cc in cryptoCoins) {
      var found = current.firstWhereOrNull((element) => element.id == cc.id);
      if (found == null) {
        newCoins.add(cc);
      }
    }
    
    cryptoCoinBox.putMany(newCoins);
  }

  List<CryptoCoin>? getCryptoCoins() {
    if (cryptoCoinBox.getAll().isEmpty) {
      return null;
    }
    return cryptoCoinBox.getAll();
  }

  List<CryptoCoin>? getCryptoCoinByIds(List<String> ids) {
    List<CryptoCoin> results = [];
    for (String id in ids) {
      final query = cryptoCoinBox.query(CryptoCoin_.id.equals(id)).build();
      final coins = query.find();
      query.close();
      if (coins.isNotEmpty) {
        results.add(coins.first);
      }
    }
    return results;
  }

  List<CryptoCoin>? findStarredCryptoCoins() {
    final query = cryptoCoinBox.query(CryptoCoin_.starred.equals(true)).build();
    final coins = query.find();
    query.close();
    return coins;
  }
}
