import 'package:bancolombia_test/features/auth/presentation/controller/auth_controller.dart';
import 'package:bancolombia_test/features/auth/presentation/widgets/auth_buttons.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import '../../../../theme/padding.dart';
import '../widgets/email_textfield.dart';
import '../widgets/password_textfield.dart';
import '../widgets/toggle_button.dart';

class AuthPage extends GetView<AuthController> {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: controller.formKey,
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: const [
            AuthToggleBtn(),
            PaddingWrapper.paddingSmVertical,
            EmailTextfield(),
            PaddingWrapper.paddingSmVertical,
            PasswordTextfield(),
            PaddingWrapper.paddingMdVertical,
            AuthButtons(),
      ],)))
    );
  }
}