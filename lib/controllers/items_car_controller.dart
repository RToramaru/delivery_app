import 'package:delivery_app/models/product_model.dart';
import 'package:flutter/cupertino.dart';

class ItemsCarController extends ChangeNotifier {
  
  List<ProductModel> items = [];

  void addItems(ProductModel item) {
    items.add(item);
    notifyListeners();
  }

  void removeItems(ProductModel item) {
    items.remove(item);
    notifyListeners();
  }

}