import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';
import 'package:project5/data/all_users.dart';
import 'package:project5/screens/login_screen.dart';
import 'package:project5/screens/user_screen_navigator.dart';
import 'package:project5/services/setup.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  setup();
  runApp(
    DevicePreview(
      enabled: false,
      builder: (context) => const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GetIt.I.get<AllUsers>().currentUser != null ? const UserScreenNavigator() : const LoginScreen()
    );
  }
}