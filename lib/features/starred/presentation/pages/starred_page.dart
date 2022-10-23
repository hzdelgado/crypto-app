import 'package:bancolombia_test/features/starred/presentation/controller/starred_controller.dart';
import 'package:bancolombia_test/global_widgets/app_bar/app_bar.dart';
import 'package:bancolombia_test/global_widgets/text/list_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../list_crypto/presentation/widgets/list_view/list_view.dart';

class StarredPage extends GetView<StarredController> {
  const StarredPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CryptoAppBar(title: "Favoritos",),
        body: Padding(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ListHeader(title:"Criptos favoritos"),
                CryptoListView(coins: controller.paginatedStarredCoins, showStarred: false,)
                
              ],
            ))));
  }
  
}