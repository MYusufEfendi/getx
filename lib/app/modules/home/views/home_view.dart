import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getx_test/app/util/extension/loading_extension.dart';
import 'package:getx_test/app/util/extension/sizedbox_extension.dart';
import 'package:getx_test/app/util/util.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          appBar: AppBar(
            title: const Text('HomeView'),
            centerTitle: true,
          ),
          body: ListView(
            padding: EdgeInsets.symmetric(horizontal: 12.width()),
            children: List.generate(
                controller.list.length,
                (index) => Container(
                    margin: EdgeInsets.symmetric(vertical: 5.width()),
                    width: Get.width,
                    height: 100,
                    padding: EdgeInsets.all(12.width()),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.width()),
                        color: Colors.grey),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        controller.list[index].firstName.text(TextStyle()),
                        12.verticalSpace(),
                        controller.list[index].email.text(TextStyle()),
                        12.verticalSpace(),
                        controller.list[index].id.toString().text(TextStyle()),
                      ],
                    ))),
          ),
        ).regularLoading(isLoading: controller.isLoading.value));
  }
}
