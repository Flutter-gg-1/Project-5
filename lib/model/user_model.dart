class UserModel {
  UserModel({
    required this.name,
    required this.password,
  });
  late final String name;
  late final String password;

  UserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    password = json['password'];

  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['password'] = password;
    return data;
  }
}
