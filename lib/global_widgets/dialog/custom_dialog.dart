import 'dart:async';
import 'dart:ui';

import 'package:bancolombia_test/features/auth/data/datasources/firebase_response.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum MessageStatus { Success, Error }

class CustomDialog {
  closeDialog() {
    Get.back();
  }

  Future<dynamic> showDialog(String status, String message, {String pageRoute = ""}) {
    Timer(const Duration(seconds: 1), () {
      closeDialog();
      if(pageRoute.isNotEmpty && status != MessageStatus.Error.name) {
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
