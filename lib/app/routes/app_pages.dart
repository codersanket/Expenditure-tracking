import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'package:expenditure_tracking/app/modules/addExpanses/bindings/add_expanses_binding.dart';
import 'package:expenditure_tracking/app/modules/addExpanses/views/add_expanses_view.dart';
import 'package:expenditure_tracking/app/modules/auth/bindings/auth_binding.dart';
import 'package:expenditure_tracking/app/modules/auth/views/auth_view.dart';
import 'package:expenditure_tracking/app/modules/auth/views/root_view.dart';
import 'package:expenditure_tracking/app/modules/home/bindings/home_binding.dart';
import 'package:expenditure_tracking/app/modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.ROOT;
  static var args;

  static final routes = [
    GetPage(
      settings: RouteSettings(arguments: args),
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.AUTH,
      page: () => AuthView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.ROOT,
      page: () => RootView(),
      binding: AuthBinding(),
    ),
    GetPage(
      settings: RouteSettings(),
      transition: Transition.downToUp,
      name: _Paths.ADD_EXPANSES,
      transitionDuration: Duration(milliseconds: 300),
      page: () => AddExpansesView(),
      binding: AddExpansesBinding(),
    ),
  ];
}
