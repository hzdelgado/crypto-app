import 'package:bancolombia_test/features/home/presentation/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavBar extends GetView<HomeController> {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => BottomNavigationBar(
        elevation: 5,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.format_list_bulleted),
            label: "Listado"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: "Favoritos"
          ),
          BottomNavigationBarItem(
            icon: Text("VS", style: TextStyle(fontWeight: FontWeight.w700, color: Colors.grey),),
            label: "Versus"
          ),
        ],
        currentIndex: controller.selectedIndex.value,
        selectedItemColor: Colors.blue,
        onTap: (int index) => controller.changeSelectedPage(index),
      ));
  }
}