import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:project5/data_layer/user_data.dart';
import 'package:project5/screens/home_screen.dart';
import 'package:project5/services/setup.dart';

import 'screens/log_in_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await setup();
  GetIt.I.get<UserData>().loadData();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    final locator = GetIt.I.get<UserData>();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: locator.isLogedIn() ? const HomeScreen() : const LogInScreen(),
    );
  }
}
