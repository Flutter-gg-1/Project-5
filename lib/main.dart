import 'package:get_storage/get_storage.dart';
import 'package:flutter/material.dart';
import 'package:project/login/log_in.dart';
import 'package:project/bottom_nav/bottom_nav.dart';
import 'package:project/setup/setup.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setup();
  await GetStorage.init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final box = GetStorage();
    final isLoggedIn = box.read('isLoggedIn') ?? false;

    return MaterialApp(
      home: isLoggedIn ? const BottomNav() : const LogIn(),
    );
  }
}
