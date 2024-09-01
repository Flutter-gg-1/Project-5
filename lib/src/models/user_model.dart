import 'package:project_5/src/data_layer/post_data.dart';
import 'package:project_5/src/models/post_models.dart';

class UserModel {
  String? username;
  String? password;
  bool? loginStatus;
  String? image ;
 

  UserModel({ this.username, this.password, this.loginStatus});

  UserModel.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    password = json['password'];
    loginStatus = json['login_status'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};

    data['username'] = username;
    data['password'] = password;
    data['login_status'] = loginStatus;
    data['image'] = image;
    return data;
  }
}
