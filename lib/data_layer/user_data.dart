import 'package:blog_app/models/user_model.dart';

class UserData {
  List<UserModel> Users = [];

  addNewUser({required UserModel username}){
    Users.add(username);
  }
}