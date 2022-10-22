import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/auth_controller.dart';

class LoginButton extends GetView<AuthController> {
  const LoginButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => ElevatedButton(
        onPressed: controller.onLoginPressed,
        child: controller.isLoading.value
            ? const CircularProgressIndicator(color: Colors.white)
            : const Text(
                "Ingresar!",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
              )));
  }
}
