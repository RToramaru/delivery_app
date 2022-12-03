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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['password'] = this.password;
    data['phone'] = this.phone;
    data['address'] = this.address;
    data['card'] = this.card;
    return data;
  }
}