import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expenditure_tracking/Utills/snacbar_utills.dart';
import 'package:expenditure_tracking/app/controller.dart';
import 'package:expenditure_tracking/services/user_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:expenditure_tracking/models/expenditure_model.dart';
import '../../../../locator.dart';
import '../../../../services/Firestore Services/firestore_services.dart';

class HomeController extends LoadingController {
  var _expenditures = Rxn<List<ExpenditureModel>>();

  FirestoreServices _firestoreServices = locator<FirestoreServices>();

  List<ExpenditureModel> get expenditures => _expenditures.value;
  var _budget = 0.0.obs;

  double get budget => _budget.value;

  updateBudget(String text) {
    _budget.value = double.parse(text);
  }

  @override
  void onInit() {
    super.onInit();
    getExpenditure();
  }

  Future<void> getExpenditure() async {
    try {
      setState(true);
      _expenditures.value =
          await _firestoreServices.getExpenditure(locator<UserService>().uid);
      _expenditures.value.sort((a, b) => b.timestamp.compareTo(a.timestamp));
      setState(false);
    } on FirebaseException catch (e) {
      setState(false);
      Utills().showSnackBar("Error", e.message);
    }
  }

  Future<void> deleteExpanses(id) async {
    try {
      _expenditures.value.removeWhere((element) => element.docId == id);
      await _firestoreServices.deleteExpanses(locator<UserService>().uid, id);
      getExpenditure();
    } catch (e) {
      Utills().showSnackBar("Error", e.message);
    }
  }
}
