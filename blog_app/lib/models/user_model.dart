class UserModel {
  late String userName;
  String? position;
  late String password;
  String? avatar = "assets/avatar_holder.png";

  UserModel(
      {required this.userName,
      this.position,
      required this.password,
      this.avatar});

  UserModel.fromJson(Map<String, dynamic> json) {
    userName = json['userName'];
    position = json['position'];
    password = json['password'];
    avatar = json['avatar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userName'] = userName;
    data['position'] = position;
    data['password'] = password;
    data['avatar'] = avatar;
    return data;
  }
}
