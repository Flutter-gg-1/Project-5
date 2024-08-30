import 'package:flutter/material.dart';
import 'package:project5/screens/login_screen.dart';
import 'package:project5/services/setup.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setup();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LoginScreen()
    );
  }
}