import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum MessageStatus { success, error }

class CustomDialog {
  closeDialog() {
    Get.back();
  }

  Future<dynamic> showDialog(String status, String message, {String pageRoute = ""}) {
    Timer(const Duration(seconds: 1), () {
      closeDialog();
      if(pageRoute.isNotEmpty && status != MessageStatus.error.name) {
        Get.toNamed(pageRoute);
      }
    });
    return Get.defaultDialog(
      title: status,
      middleText: message,
      backgroundColor: Colors.white,
    );
  }
}
