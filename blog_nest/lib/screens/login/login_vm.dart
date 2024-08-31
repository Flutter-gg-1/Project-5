import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import '../../managers/nav_mgr.dart';
import '../../managers/user_mgr.dart';

class LoginVM {
  final dataMgr = GetIt.I.get<UserMgr>();
  final navMgr = GetIt.I.get<NavMgr>();
  final userMgr = GetIt.I.get<UserMgr>();
  final nameController = TextEditingController();
  final pwdController = TextEditingController();
  bool shouldNavigate = false;
  bool shouldShowAlert = false;

  Future<void> login() async {
    print(userMgr.allUsers.length);
    for (var user in userMgr.allUsers) {
      if (user.username.toLowerCase() == nameController.text.toLowerCase() &&
          user.password == pwdController.text) {
        userMgr.setCurrentUser(user: user, isSignIn: true);
        shouldNavigate = true;
      } else {
        shouldShowAlert = true;
      }
    }
  }

  void guestLogin() => shouldNavigate = true;
}
