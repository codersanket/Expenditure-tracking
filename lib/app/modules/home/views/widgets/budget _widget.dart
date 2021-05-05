import 'package:expenditure_tracking/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class BudgetWidget extends GetView<HomeController> {
  String _budget;
  dialog() {
    return AlertDialog(
      title: Text('Budget'),
      content: Row(
        children: [
          Text(
            "₹",
            style: TextStyle(
                color: Color(0xff001A2E),
                fontSize: 35,
                fontWeight: FontWeight.bold),
          ),
          Flexible(
            child: TextField(
              onChanged: (val) {
                _budget = val;
              },
              keyboardType: TextInputType.number,
              style: TextStyle(
                  color: Color(0xff001A2E),
                  fontSize: 35,
                  fontWeight: FontWeight.bold),
              controller:
                  TextEditingController(text: controller.budget.toString()),
              decoration: InputDecoration(
                  border: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey))),
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          // textColor: Colors.black,
          onPressed: () {
            Get.back();
          },
          child: Text('CANCEL'),
        ),
        TextButton(
          // textColor: Colors.black,
          onPressed: () {
            controller.updateBudget(_budget);
            Get.back();
          },
          child: Text('Update'),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Text(
            "My budget",
            style: TextStyle(color: Color(0xffF8FDFC), fontSize: 25),
          ),
          SizedBox(
            height: 10,
          ),
          Obx(() {
            return Row(
              children: [
                Text(
                  "₹${controller.budget.toString()}",
                  style: TextStyle(
                      color: Color(0xffF8FDFC),
                      fontSize: 35,
                      fontWeight: FontWeight.bold),
                ),
                IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {
                      showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (context) => dialog());
                    })
              ],
            );
          }),
        ],
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
    );
  }
}
