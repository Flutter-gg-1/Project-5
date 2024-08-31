import 'package:flutter/widgets.dart';
import '../extensions/img_ext.dart';
import '../utils/img_converter.dart';

class User {
  int id;
  String name;
  String jobTitle;
  String avatarData;
  String username;
  String password;
  AssetImage? img;

  User({
    required this.id,
    required this.name,
    required this.jobTitle,
    required this.avatarData,
    required this.username,
    required this.password,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      jobTitle: json['jobTitle'],
      avatarData: json['avatarData'],
      username: json['username'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'jobTitle': jobTitle,
        'avatarData': avatarData,
        'username': username,
        'password': password
      };

  static Future<List<User>> getDefaultUsers() async {
    return [
      User(
        id: 1,
        name: 'Kyle Barr',
        jobTitle: 'Software developer',
        avatarData: await ImgConverter.assetImgToData(Img.blueN),
        username: 'kyle',
        password: '123',
      ),
      User(
        id: 2,
        name: 'John Doe',
        jobTitle: 'Magician',
        avatarData: await ImgConverter.assetImgToData(Img.orangeN),
        username: 'john',
        password: '123',
      ),
    ];
  }
}
