import 'package:get/get.dart';

class LoadingController extends GetxController {
  RxBool _loading = false.obs;
  bool get loading => _loading.value;

  setState(bool val) {
    _loading.value = val;
  }
}
