import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery_app/models/user_model.dart';
import 'package:flutter/cupertino.dart';

class UserController {
  final _collection = FirebaseFirestore.instance.collection('users');

  TextEditingController fieldTextUserName = TextEditingController();
  TextEditingController fieldTextUserEmail = TextEditingController();
  TextEditingController fieldTextUserPassword = TextEditingController();
  TextEditingController fieldTextUserPhone = TextEditingController();
  TextEditingController fieldTextUserAddress = TextEditingController();
  TextEditingController fieldTextUserCard = TextEditingController();

  Future<bool> createUser(String name, String email, String password,
      String phone, String address, String card) async {
    try {
      UserModel user = UserModel(
          name: name,
          email: email,
          password: password,
          phone: phone,
          address: address,
          card: card);
      await _collection.doc(email).set(user.toJson());
      _clearFields();
      return true;
    } catch (e) {
      _clearFields();
      return false;
    }
  }

  Future<UserModel> getUser(String email) async {
    var doc = await _collection.doc(email).get();
    return UserModel.fromJson(doc.data()!);
  }

  Future<bool> checkUser(String email, String password) async {
    var doc = await _collection.doc(email).get();
    if(doc.exists){
      return doc.data()!['password'] == password;
    }
    return false;
  }

  void _clearFields() {
    fieldTextUserName.clear();
    fieldTextUserEmail.clear();
    fieldTextUserPassword.clear();
    fieldTextUserPhone.clear();
    fieldTextUserAddress.clear();
    fieldTextUserCard.clear();
  }
}
