import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import '../../managers/nav_mgr.dart';
import '../../managers/user_mgr.dart';

class LoginVM {
  final dataMgr = GetIt.I.get<UserMgr>();
  final navMgr = GetIt.I.get<NavMgr>();
  final nameController = TextEditingController();
  final pwdController = TextEditingController();

  Future<void> login() async {}
}
