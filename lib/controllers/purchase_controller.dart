import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery_app/models/purchase_model.dart';
import 'package:flutter/cupertino.dart';

class PurchaseController{
  var _collection = FirebaseFirestore.instance.collection('purchase');
  List<PurchaseModel> purchases = [];
  String payment = 'card';
  bool alterPayment = false;
  bool alterAddress = false;

  TextEditingController fieldTextCard = TextEditingController();
  TextEditingController fieldTextAddress = TextEditingController();

  void configureCollection(String email) {
    _collection = _collection.doc(email).collection('purchase');
  }

  Future<void> addPurchase(Map<String, dynamic> purchase) async {
    await _collection.add(purchase);
  }

  Future<void> getPurchases() async {
    purchases.clear();
    final docs = await _collection.get();

    for (var doc in docs.docs) {
      purchases.add(PurchaseModel.fromMap(doc.data()));
    }
  }

}