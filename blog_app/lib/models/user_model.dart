import 'package:blog_app/models/post_model.dart';

class UserModel {
  late String userName;
  late String position;
  late String password;
  String? avatar;
  List<PostModel>? posts;
  List<PostModel>? savedPostes;

  UserModel(
      {required this.userName,
      required this.position,
      required this.password,
      required this.avatar,
      this.posts});

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
