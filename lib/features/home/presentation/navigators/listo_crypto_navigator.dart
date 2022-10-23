import 'package:bancolombia_test/features/list_crypto/presentation/binding/list_crypto_binding.dart';
import 'package:bancolombia_test/features/list_crypto/presentation/controller/list_crypto_controller.dart';
import 'package:bancolombia_test/features/list_crypto/presentation/pages/list_crypto_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../routes/app_pages.dart';

class ListCryptoNavigator extends StatelessWidget {
  const ListCryptoNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator(
        key: Get.nestedKey(1),
        initialRoute: AppRoutes.list,
        onGenerateRoute: (settings) {
          if (settings.name == AppRoutes.list) {
            Get.put(ListCryptoController());
            return GetPageRoute(
                page: () => const ListCryptoPage(), binding: ListCryptoBinding());
          }
          return null;
        });
  }}