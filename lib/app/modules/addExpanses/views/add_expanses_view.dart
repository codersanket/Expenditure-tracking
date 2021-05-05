import 'package:expenditure_tracking/app/Widgets/budget_widget_tile.dart';
import 'package:expenditure_tracking/app/modules/addExpanses/views/widgets/app_bar.dart';
import 'package:expenditure_tracking/app/modules/addExpanses/views/widgets/categories_widget.dart';
import 'package:expenditure_tracking/app/modules/addExpanses/views/widgets/text_field.dart';
import 'package:expenditure_tracking/models/categories_model.dart';
import 'package:expenditure_tracking/models/expenditure_model.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_expanses_controller.dart';

class AddExpansesView extends GetView<AddExpansesController> {
  ExpenditureModel expanditureModel;

  final TextEditingController _exapnses = TextEditingController();
  final TextEditingController _notes = TextEditingController();

  @override
  Widget build(BuildContext context) {
    expanditureModel = Get.arguments;
    if (expanditureModel != null) {
      _exapnses.text = expanditureModel.amount;
      _notes.text = expanditureModel.remark;
      controller.setCategory(categories.singleWhere(
          (element) => element.title == expanditureModel.category));
    }

    return Scaffold(
      backgroundColor: Color(0xff21CE99),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(top: 50),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          ),
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Appbar(),
              Flexible(
                child: Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      width: 70,
                      height: 40,
                      decoration: BoxDecoration(
                          color: Color(0xff21CE99),
                          borderRadius: BorderRadius.circular(30)),
                      child: Center(
                        child: Text(
                          "₹",
                          style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Flexible(
                      child: CustomeTextField(
                        expanses: _exapnses,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              CategoriesWidget(),
              Padding(
                padding: const EdgeInsets.all(30),
                child: Row(
                  children: [
                    ClipOval(
                      child: Container(
                        height: 50,
                        width: 50,
                        color: Color(0xff00182C),
                        child: Icon(
                          Icons.notes,
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Flexible(
                      child: TextField(
                        controller: _notes,
                        cursorColor: Color(0xff21CE99),
                        style: TextStyle(
                            color: Color(0xff00182C),
                            fontSize: 22,
                            fontWeight: FontWeight.w700),
                        decoration: InputDecoration(
                          hintText: "Notes",
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(child: SizedBox()),
              Container(
                width: MediaQuery.of(context).size.width * 0.6,
                height: MediaQuery.of(context).size.width * 0.12,
                child: Obx(() {
                  return expanditureModel == null
                      ? MaterialButton(
                          onPressed: () async {
                            await controller.addExpanses(
                              ExpenditureModel(
                                remark: _notes.text,
                                category: controller.categoriesModel.title,
                                amount: _exapnses.text,
                                timestamp: DateTime.now()
                                    .millisecondsSinceEpoch
                                    .toString(),
                              ),
                            );
                            Get.back();
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: controller.loading
                              ? CircularProgressIndicator()
                              : Text(
                                  "Add",
                                  style: TextStyle(
                                      color: Color(0xffFDFEFF), fontSize: 22),
                                ),
                          color: Color(0xff00182C),
                        )
                      : MaterialButton(
                          onPressed: () async {
                            await controller.updateExpanses(
                                ExpenditureModel(
                                    remark: _notes.text,
                                    category: controller.categoriesModel.title,
                                    amount: _exapnses.text,
                                    timestamp: expanditureModel.timestamp),
                                expanditureModel.docId);
                            Get.back();
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: controller.loading
                              ? CircularProgressIndicator()
                              : Text(
                                  "Update",
                                  style: TextStyle(
                                      color: Color(0xffFDFEFF), fontSize: 22),
                                ),
                          color: Color(0xff00182C),
                        );
                }),
              )
            ],
            mainAxisSize: MainAxisSize.max,
          ),
        ),
      ),
    );
  }
}
