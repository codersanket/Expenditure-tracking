import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: AppPages.routes,
      initialRoute: AppPages.INITIAL,
      
      debugShowCheckedModeBanner: false,
      title: 'Expenditure Tracking',
      theme: ThemeData(
          appBarTheme: AppBarTheme(
              iconTheme: IconThemeData(color: Color(0xff001A2E), size: 25)),
          iconTheme: IconThemeData(color: Color(0xff001A2E), size: 25)),
    );
  }
}
