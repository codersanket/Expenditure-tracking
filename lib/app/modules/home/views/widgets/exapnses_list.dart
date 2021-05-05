import 'package:expenditure_tracking/app/Widgets/budget_widget_tile.dart';
import 'package:expenditure_tracking/app/modules/home/controllers/home_controller.dart';
import 'package:expenditure_tracking/app/routes/app_pages.dart';
import 'package:expenditure_tracking/models/categories_model.dart';
import 'package:expenditure_tracking/models/expenditure_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class ExpansesList extends GetView<HomeController> {
  CategoriesModel getCategory(String title) {
    return categories.singleWhere((element) => element.title == title);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        child: Obx(() {
          if (controller.loading) {
            return Center(child: CircularProgressIndicator());
          }

          if (controller.expenditures == null ||
              controller.expenditures.isEmpty) {
            return Center(child: Text("Add Expanses"));
          }
          return ListView.builder(
            itemCount: controller.expenditures.length,
            itemBuilder: (context, i) {
              ExpenditureModel _expanditureModel = controller.expenditures[i];
              return Dismissible(
                key: ValueKey(i),
                onDismissed: (val) {
                  controller.deleteExpanses(_expanditureModel.docId);
                },
                background: Container(
                  color: Colors.red,
                  child: Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                ),
                child: Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Center(
                      child: BudgetTile(
                    onpressed: () {
                      Get.toNamed(Routes.ADD_EXPANSES,
                          arguments: _expanditureModel);
                    },
                    text: _expanditureModel.category,
                    subTitle: _expanditureModel.remark,
                    image: getCategory(_expanditureModel.category).image,
                    color: getCategory(_expanditureModel.category).color,
                    trailing: Text(
                      "₹${_expanditureModel.amount}.0",
                      style: TextStyle(
                          color: Color(0xffFA7A42),
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    ),
                  )),
                ),
              );
            },
          );
        }));
  }
}
