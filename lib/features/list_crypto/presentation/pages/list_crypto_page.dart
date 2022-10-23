import 'package:bancolombia_test/features/list_crypto/presentation/controller/list_crypto_controller.dart';
import 'package:bancolombia_test/features/list_crypto/presentation/widgets/list_view/list_view.dart';
import 'package:bancolombia_test/features/list_crypto/presentation/widgets/search_bar.dart';
import 'package:bancolombia_test/global_widgets/app_bar/app_bar.dart';
import 'package:bancolombia_test/global_widgets/text/list_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListCryptoPage extends GetView<ListCryptoController> {
  const ListCryptoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CryptoAppBar(body: CryptoSearchBar(),),
        body: Padding(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ListHeader(title: "Informacion de criptos"),
                // ignore: invalid_use_of_protected_member
                Obx(()=> CryptoListView(coins: controller.paginatedCryptoCoins.value,))
              ],
            ))));
  }
}
