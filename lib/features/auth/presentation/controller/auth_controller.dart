import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  late TextEditingController emailController;
  late TextEditingController passController;
  final formKey = GlobalKey<FormState>();
  final  RxList<bool> selections = List.generate(2, (_)=>false ).obs;
  RxInt selectedToggledId = 0.obs;

  @override
  void onInit() {
    emailController = TextEditingController();
    passController = TextEditingController();
    super.onInit();
  }

  onRegisterPressed() {

  }

  onToggle(int index) {
    for (int i = 0; i < selections.length; i++) {
            selections[i] = i == index;
      }
  }
}