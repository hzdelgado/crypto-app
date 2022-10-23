import 'dart:async';

import 'package:bancolombia_test/features/list_crypto/data/datasources/coingecko_manager.dart';
import 'package:bancolombia_test/features/list_crypto/domain/entities/crypto_coin.dart';
import 'package:bancolombia_test/features/list_crypto/domain/repositories/crypto_coin_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListCryptoController extends GetxController {
  RxList<CryptoCoin> paginatedCryptoCoins = <CryptoCoin>[].obs;
  RxList<CryptoCoin> allCryptoCoins = <CryptoCoin>[].obs;
  final coinGeckoManager = Get.find<CoinGeckoManager>();
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

  getCryptoCoins() async {
    var coinList =
        await coinGeckoManager.getCoinsDetailed(page: currentPage.value);
    if (coinList != null) {
      paginatedCryptoCoins(coinList);
      cryptoCoinBox.saveCryptoCoins(paginatedCryptoCoins);
      allCryptoCoins.addAll(cryptoCoinBox.getCryptoCoins() ?? []);
    }
  }

  onSearchTermChanged(String value) {
    List<CryptoCoin> result =
        allCryptoCoins.where((element) => element.name!.toLowerCase().contains(value.toLowerCase())).toList();
    paginatedCryptoCoins.clear();
    if (result.length <= 15) {
      paginatedCryptoCoins.addAll(result);
    } else {
      paginatedCryptoCoins.addAll(result.sublist(0, 15));
    }
  }

  onStarButtonPressed(String id) {}

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
