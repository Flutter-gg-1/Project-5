import 'package:project_5/models/login_model.dart';

class LoginData {
  List<LoginModel> loginDetail = [];

  addUser({required LoginModel newUser}) {
    loginDetail.add(newUser);
  }
}
