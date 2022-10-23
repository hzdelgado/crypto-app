import 'package:bancolombia_test/features/auth/presentation/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'login_btn.dart';
import 'register_btn.dart';

class AuthButtons extends GetView<AuthController> {
  const AuthButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.selectedToggledIndex.value == 0? const RegisterButton(): const LoginButton());
  }
}