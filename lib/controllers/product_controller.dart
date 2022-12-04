import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery_app/models/product_model.dart';

class ProductController {
  final _collection = FirebaseFirestore.instance.collection('products');
  List<ProductModel> products = [];

  Future<bool> createProduct(String name, String description, double price,
      String image, double stars) async {
    try {
      ProductModel product = ProductModel(
          name: name,
          description: description,
          price: price,
          image: image,
          stars: stars);
      await _collection.doc(name).set(product.toMap());
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<void> getProducts() async {
    products.clear();
    var docs = await _collection.get();
    for (var doc in docs.docs) {
      products.add(ProductModel.fromMap(doc.data()));
    }
  }
}
