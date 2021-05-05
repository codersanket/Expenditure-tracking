import 'package:expenditure_tracking/app/modules/auth/controllers/auth_controller.dart';
import 'package:expenditure_tracking/app/modules/auth/views/auth_view.dart';
import 'package:expenditure_tracking/app/modules/home/bindings/home_binding.dart';
import 'package:expenditure_tracking/app/modules/home/controllers/home_controller.dart';
import 'package:expenditure_tracking/app/modules/home/views/home_view.dart';
import 'package:expenditure_tracking/locator.dart';
import 'package:expenditure_tracking/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RootView extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (Get.find<AuthController>().firebaseUser != null) {
        locator<UserService>().firebaseUid =
            Get.find<AuthController>().firebaseUser.uid;
        Get.put(HomeController());
      }
      return AnimatedSwitcher(
        duration: Duration(milliseconds: 300),
        child: Get.find<AuthController>().firebaseUser == null
            ? AuthView()
            : HomeView(),
      );
    });
  }
}
