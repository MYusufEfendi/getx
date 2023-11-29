import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getx_test/app/routes/app_pages.dart';
import 'package:getx_test/app/util/extension/inkwell_extensions.dart';
import 'package:getx_test/app/util/extension/loading_extension.dart';
import 'package:getx_test/app/util/extension/sizedbox_extension.dart';
import 'package:getx_test/app/util/function/keyboard.dart';
import 'package:getx_test/app/util/util.dart';

import '../../../util/widget/regular_text_field.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
            body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            60.verticalSpace(),
            "Login".text(TextStyle()),
            60.verticalSpace(),
            RegularTextFiled(
              textC: controller.emailC,
              hint: "Masukkan Email Anda",
            ),
            12.verticalSpace(),
            RegularTextFiled(
              textC: controller.passwordC,
              hint: "Masukkan Password Anda",
            ),
            15.verticalSpace(),
            ElevatedButton(
                onPressed: () {
                  Keyboard.unfocus();
                  if (controller.validate()) {
                    controller.postLogin();
                  }
                },
                child: "Login".text(TextStyle())),
            12.verticalSpace(),
            "Belum Punya Akun , Silahkan Daftar"
                .text(TextStyle())
                .regularInkWell(onTap: () {
              Get.toNamed(Routes.REGISTRATION);
            })
          ],
        )
                .regularLoading(isLoading: controller.isLoading.value)
                .paddingAll(16.width())));
  }
}
