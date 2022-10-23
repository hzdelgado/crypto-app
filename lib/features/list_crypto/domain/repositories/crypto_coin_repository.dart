import 'dart:convert';

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

  void saveCryptoCoins(List<CryptoCoin> cryptoCoins) {
    List<CryptoCoin>? current =  getCryptoCoins();
    List<CryptoCoin> newCoins = [];
    if(current != null) {
      for (var cc in cryptoCoins) {
        var found = current.firstWhereOrNull((element) => element.id == cc.id);
        if(found == null) {
          newCoins.add(cc);
        }
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
}
