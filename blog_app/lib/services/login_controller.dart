import 'dart:math';
import 'package:blog_app/current_page.dart';
import 'package:blog_app/data/user_data.dart';
import 'package:blog_app/helper/extensions/nav.dart';
import 'package:blog_app/services/setup.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

extension LoginController on BuildContext {
  login({required String username, required String password}) {
    String dbusername = GetIt.I.get<UserData>().users.first.userName;
    String dbpassword = GetIt.I.get<UserData>().users.first.password;
    int token = Random().nextInt(99999);

    if (dbusername == username && dbpassword == password) {
      box.write("token", token);
      navTo(page: const CurrentPage());
    } else {
      ScaffoldMessenger.of(this)
          .showSnackBar(const SnackBar(content: Text("account not found")));
    }
  }
}
