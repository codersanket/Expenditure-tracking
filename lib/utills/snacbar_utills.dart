import 'package:get/get.dart';

class Utills {
  showSnackBar(String title, String message) {
    return Get.snackbar(title, message,
        snackPosition: SnackPosition.BOTTOM, duration: Duration(seconds: 1));
  }
}
