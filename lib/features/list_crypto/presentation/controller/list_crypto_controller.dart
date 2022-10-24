import 'package:bancolombia_test/features/list_crypto/data/datasources/coingecko_manager.dart';
import 'package:bancolombia_test/features/list_crypto/domain/entities/crypto_coin.dart';
import 'package:bancolombia_test/features/list_crypto/domain/repositories/crypto_coin_repository.dart';
import 'package:bancolombia_test/features/starred/presentation/controller/starred_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListCryptoController extends GetxController {
  RxList<CryptoCoin> paginatedCryptoCoins = <CryptoCoin>[].obs;
  RxList<CryptoCoin> allCryptoCoins = <CryptoCoin>[].obs;
  final coinGeckoManager = Get.find<CoinGeckoManager>();
  final starredController = Get.find<StarredController>();
  final searchBarController = TextEditingController();
  final cryptoCoinBox = Get.find<CryptoCoinRepository>();
  final RxInt searchResultPage = 1.obs;
  final RxInt searchResultTotal = 1.obs;
  final RxInt currentPage = 1.obs;
  @override
  void onInit() {
    getCryptoCoins();
    super.onInit();
  }

  getCoinIdList(List<CryptoCoin> coins) {
    List<String> ids = [];
    for (var c in coins) {
      if (c.id != null && !ids.contains(c.id)) {
        ids.add(c.id!);
      }
    }
    return ids;
  }

  getCryptoCoins() async {
    var coinList =
        await coinGeckoManager.getCoinsDetailed(page: currentPage.value);
    if (coinList != null) {
      List<String> ids = getCoinIdList(coinList);
      paginatedCryptoCoins(cryptoCoinBox.getCryptoCoinByIds(ids));
      cryptoCoinBox.saveCryptoCoins(coinList);
      allCryptoCoins.clear();
      allCryptoCoins.addAll(cryptoCoinBox.getCryptoCoins() ?? []);
    }
  }

  onSearchTermChanged(String value) {
    if (value.isNotEmpty) {
      List<CryptoCoin> result = allCryptoCoins
          .where((element) =>
              element.name!.toLowerCase().contains(value.toLowerCase()))
          .toList();
      paginatedCryptoCoins.clear();
      if (result.length <= 15) {
        paginatedCryptoCoins.addAll(result);
      } else {
        paginatedCryptoCoins.addAll(result.sublist(0, 15));
      }
    } else {
      currentPage(1);
      getCryptoCoins();
    }
  }

  onStarButtonPressed(CryptoCoin coin, bool isStarred) {
    coin.starred = isStarred;
    cryptoCoinBox.saveCryptoCoin(coin);
    starredController.updateStr.add(true);
    //CryptoCoin? cryptoCoin = cryptoCoinBox.getCryptoCoinById(coin.id!);
  }

  onBackPagePressed() {
    if (searchBarController.text.isEmpty) {
      if (currentPage.value > 1) {
        currentPage(currentPage.value - 1);
        getCryptoCoins();
      }
    }
  }

  onNextPagePressed() {
    if (searchBarController.text.isEmpty) {
      currentPage(currentPage.value + 1);
      getCryptoCoins();
    }
  }
}
