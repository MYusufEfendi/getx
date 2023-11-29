import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../util.dart';

class SnackBars {
  static flatSnackBar(message, {Color? backgroundColor}) {
    ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
      backgroundColor: backgroundColor ?? Colors.green,
      content: Text(message),
    ));
  }
}
