import 'package:flutter/material.dart';

import '../../../../core/utils/input_validation.dart';
import 'package:get/get.dart';

import '../controller/auth_controller.dart';

class PasswordTextfield extends GetView<AuthController>
    with InputValidationMixin {
  const PasswordTextfield({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Text(
        "Contraseña",
        style: TextStyle(fontWeight: FontWeight.w500),
      ),
      TextFormField(
        obscureText: true,
        controller: controller.passController,
        validator: validatePassword,
      )
    ]);
  }
}
