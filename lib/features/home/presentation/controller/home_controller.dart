import 'package:bancolombia_test/features/home/presentation/widgets/page_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../list_crypto/data/datasources/coingecko_manager.dart';

class HomeController extends GetxController {
  final RxInt selectedIndex = 0.obs;
  final selectedEntry = Entries.listCrypto.obs;
  late PageController pageController;
  final coinGeckoManager = Get.find<CoinGeckoManager>();
  final RxInt selectedPage = 1.obs;
  @override
  void onInit() {
    pageController = PageController(initialPage: 0);
  }

  changeSelectedPage(int index) {
    selectedIndex(index);
    selectedEntry(Entries.values[index]);
  }

}
