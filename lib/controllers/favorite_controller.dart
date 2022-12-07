import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery_app/models/favorite_model.dart';
import 'package:flutter/cupertino.dart';

class FavoriteController extends ChangeNotifier {
  var _collection;
  List<FavoriteModel> favorites = [];

  void configureCollection(String email) {
    _collection = FirebaseFirestore.instance.collection('favorites');
    _collection = _collection.doc(email).collection('favorites');
    getFavorites();
  }


  Future<void> getFavorites() async {
    favorites.clear();
    final docs = await _collection.get();

    for (var doc in docs.docs) {
      favorites.add(FavoriteModel.fromMap(doc.data()));
    }
    notifyListeners();
  }

  Future<void> addFavorite(FavoriteModel favorite) async {
    await _collection.doc(favorite.id).set(favorite.toMap());
    getFavorites();
  }

  Future<void> removeFavorite(String id) async {
    await _collection.doc(id).delete();
    getFavorites();
  }
}
