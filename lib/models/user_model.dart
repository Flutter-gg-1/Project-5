class UserModel {
  UserModel({
    required this.userName,
    required this.id,
  });
  late final String userName;
  late final int id;

  UserModel.fromJson(Map<String, dynamic> json) {
    userName = json['userName'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['userName'] = userName;
    data['id'] = id;
    return data;
  }
}