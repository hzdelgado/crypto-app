import 'package:bancolombia_test/core/utils/input_validation.dart';
import 'package:bancolombia_test/features/auth/presentation/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmailTextfield extends GetView<AuthController>
    with InputValidationMixin {
  const EmailTextfield({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Text(
        "Correo electrónico",
        style: TextStyle(fontWeight: FontWeight.w500),
      ),
      TextFormField(
        controller: controller.emailController,
        validator: validateEmail,
      )
    ]);
  }
}
