import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:getx_test/app/routes/app_pages.dart';
import 'package:getx_test/app/services/api_service.dart';
import 'package:getx_test/app/services/dio_services.dart';
import 'package:getx_test/app/util/extension/email_validation_extension.dart';
import 'package:getx_test/app/util/function/snackbars.dart';

class RegistrationController extends GetxController {
  TextEditingController emailC = TextEditingController();
  TextEditingController passwordC = TextEditingController();

  RxBool isLoading = false.obs;
  late ApiService _apiService;

  @override
  void onInit() {
    _apiService = ApiService(DioClient().init());
  }

  bool validate() {
    if (emailC.text.isEmpty || passwordC.text.isEmpty) {
      SnackBars.flatSnackBar("Form Tidak Boleh Kosong");
      return false;
    }
    if (!emailC.text.isValidEmail()) {
      SnackBars.flatSnackBar("Email tidak valid");

      return false;
    }
    return true;
  }

  postRegist() {
    isLoading.value = true;
    _apiService
        .register(email: emailC.text, password: passwordC.text)
        .then((value) {
      isLoading.value = false;
      SnackBars.flatSnackBar("registrasi berhasil ");
      Get.toNamed(Routes.LOGIN);
    }).catchError((e) {
      isLoading.value = false;

      SnackBars.flatSnackBar("Login Error");
    });
  }
}
