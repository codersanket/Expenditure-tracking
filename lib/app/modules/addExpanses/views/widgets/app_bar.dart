import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Appbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Text(
        "Add Transaction",
        style: TextStyle(color: Colors.black),
      ),
      centerTitle: true,
      leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            Get.back();
          }),
    );
  }
}
