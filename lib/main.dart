import 'package:blog_app/screens/login_screen.dart';
import 'package:blog_app/screens/navigation_screens/home_screen.dart';
import 'package:blog_app/services/setup.dart';
import 'package:flutter/material.dart';
import 'data/blog_data.dart';
import 'styles/colours.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setup();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          appBarTheme:
              const AppBarTheme(backgroundColor: Colours.surfacePrimary),
          scaffoldBackgroundColor: Colours.surfacePrimary),
      home: const LoginScreen()
    );
  }
}
