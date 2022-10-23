import 'package:bancolombia_test/features/home/presentation/widgets/page_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../list_crypto/presentation/pages/list_crypto_page.dart';
import '../../../starred/presentation/pages/starred_page.dart';
import '../../../versus/presentation/pages/versus_page.dart';

class HomeController extends GetxController {
  final RxInt selectedIndex = 0.obs;
  final selectedEntry = Entries.listCrypto.obs;
  late PageController pageController;

  @override
  void onInit() {
    pageController = PageController(initialPage: 0);
  }

  changeSelectedPage(int index) {
    selectedIndex(index);
    selectedEntry(Entries.values[index]);

  }
}