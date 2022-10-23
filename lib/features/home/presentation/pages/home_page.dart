import 'package:bancolombia_test/features/home/presentation/controller/home_controller.dart';
import 'package:bancolombia_test/features/home/presentation/widgets/bottom_nav_bar.dart';
import 'package:bancolombia_test/features/home/presentation/widgets/page_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => false,
        child: const Scaffold(
      body: HomePageView(),
      bottomNavigationBar: BottomNavBar(),
    ));
  }
}