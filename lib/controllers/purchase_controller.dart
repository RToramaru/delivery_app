import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery_app/models/purchase_model.dart';
import 'package:flutter/cupertino.dart';

class PurchaseController extends ChangeNotifier{
  var _collection;
  List<PurchaseModel> purchases = [];
  String payment = 'card';
  bool alterPayment = false;
  bool alterAddress = false;

  TextEditingController fieldTextCard = TextEditingController();
  TextEditingController fieldTextAddress = TextEditingController();

  void configureCollection(String email) {
    _collection = FirebaseFirestore.instance.collection('purchase');
    _collection = _collection.doc(email).collection('purchase');
    getPurchases();
  }

  Future<void> addPurchase(Map<String, dynamic> purchase) async {
    await _collection.add(purchase);
    getPurchases();
  }

  Future<void> getPurchases() async {
    purchases.clear();
    final docs = await _collection.get();

    for (var doc in docs.docs) {
      PurchaseModel p = PurchaseModel.fromMap(doc.data());
      p.id = doc.id;
      purchases.add(p);
    }
    notifyListeners();
  }

}