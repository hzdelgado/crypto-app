import 'package:bancolombia_test/features/home/presentation/controller/home_controller.dart';
import 'package:bancolombia_test/features/list_crypto/presentation/pages/list_crypto_page.dart';
import 'package:bancolombia_test/features/starred/presentation/pages/starred_page.dart';
import 'package:bancolombia_test/features/versus/presentation/pages/versus_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../navigators/listo_crypto_navigator.dart';

class HomePageView extends GetView<HomeController> {
  const HomePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller.pageController,
      itemBuilder: (ctx,indx) {
        return Obx(() => controller.selectedEntry.value.getPage);
      },
    );
  }
}

enum Entries { listCrypto, starred, versus}

extension EntryExtension on Entries {
Widget get getPage {
    return  [
      const ListCryptoNavigator(),
      StarredPage(),
      VersusPage()
    ][index];
  }
}