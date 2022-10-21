import 'package:bancolombia_test/features/auth/presentation/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterButton extends GetView<AuthController> {
  const RegisterButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: controller.onRegisterPressed, child: const Text("Registrarse!", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),));
  }
}