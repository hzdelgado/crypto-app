import 'package:bancolombia_test/features/list_crypto/presentation/controller/list_crypto_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CryptoSearchBar extends GetView<ListCryptoController> {
  const CryptoSearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      child: TextField(
      decoration: const InputDecoration(
        hintText: "Buscar",
        border: OutlineInputBorder(borderSide: BorderSide.none)
      ),
      controller: controller.searchBarController,
      onChanged: (String value) => controller.onSearchTermChanged(value),
      
    ));
  }
}