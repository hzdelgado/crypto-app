import 'package:bancolombia_test/features/list_crypto/presentation/controller/list_crypto_controller.dart';
import 'package:bancolombia_test/features/list_crypto/presentation/widgets/list_view/list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CryptoListView extends GetResponsiveView<ListCryptoController> {
  CryptoListView({Key? key}) : super(key: key);

  @override
  Widget builder() {
    return Column(children: [
       Obx(() => SizedBox(
         height: screen.height * 2/3,
         child: ListView.builder(
              shrinkWrap: true,
              itemCount: controller.paginatedCryptoCoins.length,
              physics: const AlwaysScrollableScrollPhysics(),
              itemBuilder: (ctx, index) {
                return CryptoListViewItem(
                  coin: controller.paginatedCryptoCoins[index],
                );
              }))),

              Obx(() => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                IconButton(onPressed: controller.currentPage.value == 1 || controller.paginatedCryptoCoins.isEmpty? null: controller.onBackPagePressed, icon: const Icon(Icons.chevron_left)),
                  IconButton(onPressed: controller.paginatedCryptoCoins.isEmpty? null: controller.onNextPagePressed, icon: const Icon(Icons.chevron_right))

              ],))
    ]);
  }
}
