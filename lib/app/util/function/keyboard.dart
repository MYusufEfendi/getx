import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Keyboard {
  static unfocus() {
    FocusScope.of(Get.context!).unfocus();
  }
}
