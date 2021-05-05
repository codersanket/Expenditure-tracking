import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/auth_controller.dart';

class AuthView extends GetView<AuthController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: Obx(() {
          return ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.red)),
            onPressed: Get.find<AuthController>().loading
                ? () {}
                : () {
                    Get.find<AuthController>().login();
                  },
            child: Get.find<AuthController>().loading
                ? Container(
                    padding: EdgeInsets.all(5),
                    child: CircularProgressIndicator())
                : Text("Login"),
          );
        }),
      ),
    );
  }
}
