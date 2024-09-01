import 'package:blogs_app/screens/mainWidget_screen.dart';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:blogs_app/helper/locator.dart';

import 'screens/login_screen.dart';
import 'data/services/auth_service.dart';

void main() async {
  await GetStorage.init();
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AuthService authService = locator<AuthService>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blogs App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: authService.isLoggedIn() ? MainScreen() : LoginScreen(),
    );
  }
}
