import 'package:expenditure_tracking/app/modules/home/views/widgets/app_bar.dart';
import 'package:expenditure_tracking/app/modules/home/views/widgets/budget%20_widget.dart';
import 'package:expenditure_tracking/app/modules/home/views/widgets/exapnses_list.dart';
import 'package:expenditure_tracking/app/routes/app_pages.dart';
import 'package:flutter/material.dart' hide AppBar;

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Get.toNamed(Routes.ADD_EXPANSES);
        },
        backgroundColor: Color(0xff21CE99),
      ),
      backgroundColor: Color(0xff21CE99),
      body: SafeArea(
        child: Column(
          children: [
            AppBar(),
            SizedBox(
              height: 20,
            ),
            BudgetWidget(),
            SizedBox(
              height: 30,
            ),
            Expanded(child: ExpansesList())
          ],
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
        ),
      ),
    );
  }
}
