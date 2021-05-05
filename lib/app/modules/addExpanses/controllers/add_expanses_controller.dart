import 'package:expenditure_tracking/Utills/snacbar_utills.dart';
import 'package:expenditure_tracking/app/controller.dart';
import 'package:expenditure_tracking/app/modules/home/controllers/home_controller.dart';
import 'package:expenditure_tracking/models/categories_model.dart';
import 'package:expenditure_tracking/models/expenditure_model.dart';
import 'package:expenditure_tracking/services/Firestore%20Services/firestore_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../services/user_service.dart';
import 'package:get/get.dart';

import '../../../../locator.dart';

class AddExpansesController extends LoadingController {
  Rxn<CategoriesModel> _categoriesModel = Rxn<CategoriesModel>();

  CategoriesModel get categoriesModel => _categoriesModel.value;
  FirestoreServices _firestoreServices = locator<FirestoreServices>();

  @override
  onInit() {
    super.onInit();
    _categoriesModel.value = categories[0];
  }

  setCategory(CategoriesModel cat) {
    _categoriesModel.value = cat;
  }

  addExpanses(ExpenditureModel expenditureModel) async {
    try {
      setState(true);
      await _firestoreServices.addExpanses(
          locator<UserService>().uid, expenditureModel);
      Get.find<HomeController>().getExpenditure();
      setState(false);
    } on FirebaseAuthException catch (e) {
      setState(false);
      Utills().showSnackBar("Error", e.message);
    }
  }

  updateExpanses(ExpenditureModel expenditureModel,String id) async {
    try {
      setState(true);
      await _firestoreServices.updateExpanses(
          locator<UserService>().uid, expenditureModel,id);
      Get.find<HomeController>().getExpenditure();
      setState(false);
    } on FirebaseAuthException catch (e) {
      setState(false);
      Utills().showSnackBar("Error", e.message);
    }
  }
}
