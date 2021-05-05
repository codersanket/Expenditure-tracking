import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expenditure_tracking/models/expenditure_model.dart';

class FirestoreServices {
  CollectionReference _collectionReference =
      FirebaseFirestore.instance.collection("Expenditure");

  Future<List<ExpenditureModel>> getExpenditure(String uid) async {
    try {
      QuerySnapshot _snapshot = await _collectionReference
          .doc(uid)
          .collection("Userexpenditure")
          .get();

      return _snapshot.docs.map((e) => ExpenditureModel.fromJson(e)).toList();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> addExpanses(String uid, ExpenditureModel expanditure) async {
    try {
      await _collectionReference
          .doc(uid)
          .collection("Userexpenditure")
          .add(expanditure.toJson());
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updateExpanses(
      String uid, ExpenditureModel expanditure, String id) async {
    try {
      await _collectionReference
          .doc(uid)
          .collection("Userexpenditure")
          .doc(id)
          .update(expanditure.toJson());
    } catch (e) {
      rethrow;
    }
  }

  Future<void> deleteExpanses(String uid, String id) async {
    try {
      await _collectionReference
          .doc(uid)
          .collection("Userexpenditure")
          .doc(id)
          .delete();
    } catch (e) {
      rethrow;
    }
  }
}
