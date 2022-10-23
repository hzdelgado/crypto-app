import 'dart:async';

import 'package:bancolombia_test/features/auth/data/datasources/firebase_auth.dart';
import 'package:bancolombia_test/features/auth/data/models/firebase_response.dart';
import 'package:bancolombia_test/routes/app_pages.dart';
import 'package:bancolombia_test/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../global_widgets/dialog/custom_dialog.dart';

class AuthController extends GetxController {
  late TextEditingController emailController;
  late TextEditingController passController;
  final formKey = GlobalKey<FormState>();
  final authManager = Get.find<AuthManager>();
  final CustomDialog dialog = Get.find<CustomDialog>();
  final RxBool isLoading = false.obs;
  final RxList<bool> selections = <bool>[true, false].obs;
  RxInt selectedToggledIndex = 0.obs;
  final List<Widget> toggleChildren = [
    const Text("Registrarse"),
    const Text("Ingresar"),
  ];

  @override
  void onInit() {
    emailController = TextEditingController();
    passController = TextEditingController();
    super.onInit();
  }

  bool validateAndSave() {
    final form = formKey.currentState;
    if (form != null) {
      if (form.validate()) {
        form.save();
        return true;
      }
    }
    return false;
  }

  onRegisterPressed() async {
    isLoading(true);
    if (validateAndSave()) {
      FirebaseResponse? response =
          await authManager.signUp(emailController.text, passController.text);
      isLoading(false);
      if (response != null) {
        dialog.showDialog(response.status!, response.message!,
              pageRoute: AppRoutes.home);   
      }
    } else {
      isLoading(false);
    }
  }

  onLoginPressed() async {
    isLoading(true);
    if (validateAndSave()) {
      FirebaseResponse? response =
          await authManager.signIn(emailController.text, passController.text);
      isLoading(false);
      if (response != null) {
        dialog.showDialog(response.status!, response.message!, pageRoute: AppRoutes.home);    
      }
    } else {
      isLoading(false);
    }
  }

  onToggle(int index) {
    for (int i = 0; i < selections.length; i++) {
      selections[i] = i == index;
      if (selections[i]) {
        selectedToggledIndex(i);
      }
    }
  }
}
