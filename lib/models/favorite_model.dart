class FavoriteModel{
  String id = '';

  FavoriteModel({
    required this.id,
  });

  FavoriteModel.fromMap(Map<String, dynamic> map) {
    id = map['id'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    return data;
  }

}