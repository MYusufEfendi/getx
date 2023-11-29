import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:getx_test/app/data/users_model.dart';
import 'package:getx_test/app/services/api_service.dart';
import 'package:getx_test/app/services/dio_services.dart';

class HomeController extends GetxController {
  late ApiService _apiService;

  RxBool isLoading = false.obs;
  RxList<Data> list = <Data>[].obs;

  @override
  void onInit() {
    _apiService = ApiService(DioClient().init());
    getUsers();
  }

  getUsers() {
    isLoading.value = true;
    _apiService.getUsers().then((val) {
      debugPrint("val $val");
      list.assignAll(val?.data as Iterable<Data>);
      debugPrint("val $list");

      isLoading.value = false;
    });
  }
}
