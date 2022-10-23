import 'package:bancolombia_test/features/list_crypto/domain/entities/crypto_coin.dart';
import 'package:bancolombia_test/features/list_crypto/presentation/controller/list_crypto_controller.dart';
import 'package:bancolombia_test/features/list_crypto/presentation/widgets/list_view/list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CryptoListView extends GetResponsiveView<ListCryptoController> {
  final List<CryptoCoin> coins;
  final bool showStarred;
  
  CryptoListView({Key? key, required this.coins, this.showStarred = true}) : super(key: key);

  @override
  Widget builder() {
    return Column(children: [
      SizedBox(
          height: screen.height* 2/3 - 50,
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: coins.length,
              physics: const AlwaysScrollableScrollPhysics(),
              itemBuilder: (ctx, index) {
                return CryptoListViewItem(
                  coin: coins[index],
                  showStarred: showStarred,
                );
              })),
      Obx(() => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: controller.currentPage.value == 1 ||
                          coins.isEmpty
                      ? null
                      : controller.onBackPagePressed,
                  icon: const Icon(Icons.chevron_left)),
              IconButton(
                  onPressed: coins.isEmpty || coins.length < 15
                      ? null
                      : controller.onNextPagePressed,
                  icon: const Icon(Icons.chevron_right))
            ],
          ))
    ]);
  }
}
