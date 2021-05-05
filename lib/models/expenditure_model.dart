import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
List<ExpenditureModel> expenditureModelFromJson(String str) =>
    List<ExpenditureModel>.from(
        json.decode(str).map((x) => ExpenditureModel.fromJson(x)));

String expenditureModelToJson(List<ExpenditureModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ExpenditureModel {
  ExpenditureModel({
    this.remark,
    this.amount,
    this.timestamp,
    this.category,
    this.docId
  });

  String remark;
  String amount;
  String timestamp;
  String category;
  String docId;

  factory ExpenditureModel.fromJson(DocumentSnapshot json) =>
      ExpenditureModel(
        remark: json.data()["remark"],
        amount: json.data()["amount"],
        timestamp: json.data()["timestamp"],
        category: json.data()["category"],
        docId: json.id
      );

  Map<String, dynamic> toJson() => {
        "remark": remark,
        "amount": amount,
        "timestamp": timestamp,
        "category": category,
      };
}
