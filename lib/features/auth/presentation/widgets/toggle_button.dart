import 'package:bancolombia_test/features/auth/presentation/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthToggleBtn extends GetView<AuthController> {
  const AuthToggleBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx((() => ToggleButtons(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          isSelected: controller.selections,
          onPressed: (int index) => controller.onToggle(index),
          selectedBorderColor: Colors.blue[700],
          selectedColor: Colors.white,
          fillColor: Colors.blue[200],
          constraints: const BoxConstraints(
            minHeight: 40.0,
            minWidth: 80.0,
          ),
          color: Colors.blue[400],
          children: controller.toggleChildren,
        )));
  }
}
