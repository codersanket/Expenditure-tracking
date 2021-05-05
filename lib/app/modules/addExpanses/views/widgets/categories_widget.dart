import 'package:expenditure_tracking/app/Widgets/budget_widget_tile.dart';
import 'package:expenditure_tracking/app/modules/addExpanses/controllers/add_expanses_controller.dart';
import 'package:expenditure_tracking/models/categories_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoriesWidget extends GetWidget<AddExpansesController> {
  bottomSheet(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        isDismissible: false,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        builder: (context) {
          return ListView(
              children: categories.map((e) {
            return BudgetTile(
              trailing: Icon(Icons.arrow_forward_ios),
              text: e.title,
              color: e.color,
              image: e.image,
              onpressed: () {
                controller.setCategory(e);
                Get.back();
              },
            );
          }).toList());
        });
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return BudgetTile(
        color: controller.categoriesModel.color,
        image: controller.categoriesModel.image,
        text: controller.categoriesModel.title,
        trailing: Icon(Icons.arrow_forward_ios),
        onpressed: () {
          bottomSheet(context);
        },
      );
    });
  }
}
