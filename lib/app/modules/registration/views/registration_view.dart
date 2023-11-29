import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getx_test/app/modules/registration/controllers/registration_controller.dart';
import 'package:getx_test/app/util/extension/loading_extension.dart';
import 'package:getx_test/app/util/extension/sizedbox_extension.dart';
import 'package:getx_test/app/util/function/keyboard.dart';
import 'package:getx_test/app/util/util.dart';

import '../../../util/widget/regular_text_field.dart';

class RegistrationView extends GetView<RegistrationController> {
  const RegistrationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
            body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            30.verticalSpace(),
            "Registration".text(TextStyle()),
            60.verticalSpace(),
            RegularTextFiled(
              textC: controller.emailC,
              hint: "Masukkan Email Anda",
            ),
            15.verticalSpace(),
            RegularTextFiled(
              textC: controller.passwordC,
              hint: "Masukkan Password Anda",
            ),
            30.verticalSpace(),
            ElevatedButton(
                onPressed: () {
                  Keyboard.unfocus();
                  if (controller.validate()) {
                    controller.postRegist();
                  }
                },
                child: "Registrasi".text(TextStyle())),
          ],
        )
                .regularLoading(isLoading: controller.isLoading.value)
                .paddingAll(16.width())));
  }
}
