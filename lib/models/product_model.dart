class ProductModel{
  String id = '';
  String name = '';
  String description = '';
  double price = 0.0;
  String image = '';
  double stars = 0.0;

  ProductModel({
    required this.name,
    required this.description,
    required this.price,
    required this.image,
    required this.stars,
  });

  ProductModel.fromMap(Map<String, dynamic> map) {
    name = map['name'];
    description = map['description'];
    price = map['price'];
    image = map['image'];
    stars = map['stars'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['description'] = description;
    data['price'] = price;
    data['image'] = image;
    data['stars'] = stars;
    return data;
  }
}