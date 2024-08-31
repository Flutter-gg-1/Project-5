import 'package:get_storage/get_storage.dart';
import 'package:project_5/models/login_model.dart';

class LoginData {
  List<LoginModel> loginDetail = [];
  final box = GetStorage();

  addUser({required LoginModel newUser}) {
    loginDetail.add(newUser);
    box.write("isLogin", true);
    final name = newUser.loginName;
    box.write("userName", name);
  }

  bool checkLogin() {
    if (box.hasData("isLogin")) {
      return true;
    } else {
      return false;
    }
  }

  get getName {
    return box.read("userName");
  }

  logOut() {
    box.remove("isLogin");
  }
}
