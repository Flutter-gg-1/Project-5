import 'package:blog_app/data_layer/user_data.dart';
import 'package:blog_app/services/setup.dart';
import 'package:blog_app/src/home_screen.dart';
import 'package:blog_app/src/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setup();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    GetIt.I.get<UserData>().loadStatus();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var locator = GetIt.I.get<UserData>();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: const Color(0xff111111),
          appBarTheme: const AppBarTheme(
              backgroundColor: Color(0xff1e1e1e),
              iconTheme: IconThemeData(color: Colors.white)),
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              backgroundColor: Color(0xff131313)),
          bottomSheetTheme: const BottomSheetThemeData(
              backgroundColor:  Color(0xff2e2e2e))),
      home: locator.isGust==false ? const LoginScreen() : const HomeScreen(),
    );
  }
}
