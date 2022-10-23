import 'package:bancolombia_test/features/list_crypto/presentation/controller/list_crypto_controller.dart';
import 'package:bancolombia_test/features/list_crypto/presentation/widgets/list_view/list_view.dart';
import 'package:bancolombia_test/features/list_crypto/presentation/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class ListCryptoPage extends GetView<ListCryptoController> {
  const ListCryptoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
      padding: const EdgeInsets.all(20),
      child: SingleChildScrollView(child: Column(children: [
      const CryptoSearchBar(),
      CryptoListView()
    ],))));
  }
}