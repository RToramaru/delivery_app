class UserModel{
  String name = '';
  String email = '';
  String password = '';
  String phone = '';
  String address = '';
  String card = '';

  UserModel({
    required this.name,
    required this.email,
    required this.password,
    required this.phone,
    required this.address,
    required this.card,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    password = json['password'];
    phone = json['phone'];
    address = json['address'];
    card = json['card'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    data['password'] = password;
    data['phone'] = phone;
    data['address'] = address;
    data['card'] = card;
    return data;
  }
}