import 'package:bancolombia_test/features/auth/presentation/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class AuthToggleBtn extends GetView<AuthController> {
  const AuthToggleBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx((() => ToggleButtons(
              children: [
                const Text("Registrarse"),
                const Text("Ingresar"),
              ],
              isSelected: controller.selections,
              onPressed: (int index) => controller.onToggle(index))));
  }
}