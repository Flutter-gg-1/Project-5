class UserModel {
  UserModel({
    required this.userName,
  });
  late final String userName;

  UserModel.fromJson(Map<String, dynamic> json) {
    userName = json['userName'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['userName'] = userName;
    return data;
  }
}