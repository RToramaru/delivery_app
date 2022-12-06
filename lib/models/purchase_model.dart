import 'package:delivery_app/models/product_model.dart';

class PurchaseModel{

  List<ProductModel> items = [];
  int payment = 0;
  String address = '';
  double price = 0;
  String ?id;

  PurchaseModel({required this.items, required this.payment, required this.address, required this.price});

  PurchaseModel.fromMap(Map<String, dynamic> map) {
    if (map['items'] != null) {
      items = <ProductModel>[];
      map['items'].forEach((v) {
        items.add(ProductModel.fromMap(v));
      });
    }
    payment = map['payment'];
    address = map['address'];
    price = map['price'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (items.isNotEmpty) {
      data['items'] = items.map((v) => v.toMap()).toList();
    }
    data['payment'] = payment;
    data['address'] = address;
    data['price'] = price;
    return data;
  }
}