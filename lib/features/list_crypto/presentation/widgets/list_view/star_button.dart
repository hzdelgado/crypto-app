import 'package:bancolombia_test/features/list_crypto/domain/entities/crypto_coin.dart';
import 'package:bancolombia_test/features/list_crypto/presentation/controller/list_crypto_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StarButton extends GetView<ListCryptoController> {
  final CryptoCoin coin;
  final RxBool isEnabled = false.obs;
  StarButton({Key? key, required this.coin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => IconButton(onPressed: () {
      isEnabled(!isEnabled.value);
      controller.onStarButtonPressed(coin.id!); }, icon: isEnabled.isTrue? const Icon(Icons.star, color: Colors.amber): const Icon(Icons.star_border, color: Colors.grey)));
  }
}