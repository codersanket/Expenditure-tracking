import 'package:expenditure_tracking/app/modules/auth/controllers/auth_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class AppBar extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      height: kToolbarHeight,
      width: double.infinity,
      child: Row(
        children: [
          Icon(Icons.menu),
          IconButton(
            onPressed: () {
              controller.logOut();
            },
            icon: Icon(Icons.logout),
          )
        ],
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
      ),
    );
  }
}
