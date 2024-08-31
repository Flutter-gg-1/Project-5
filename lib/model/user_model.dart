class UserModel {
  late String userName;
  late String password;
  UserModel({
    required this.userName,
    required this.password,
  });

  UserModel.empty();
  UserModel.fromJson(Map<String, dynamic> json) {
    userName = json['userName'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['userName'] = userName;
    data['password'] = password;
    return data;
  }
}
