import 'package:blog_app/screens/home_screen.dart';
import 'package:blog_app/screens/login_screen.dart';
import 'package:flutter/material.dart';

import 'styles/colours.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        bottomNavigationBarTheme: BottomNavigationBarThemeData(backgroundColor: Colours.surfaceNavBar),
        scaffoldBackgroundColor: Colours.surfacePrimary),
      home: HomeScreen()
    );
  }
}
