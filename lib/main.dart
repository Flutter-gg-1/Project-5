import 'package:flutter/material.dart';
import 'package:project_5/data_layer/login_data.dart';
import 'package:project_5/pages/login_screen.dart';
import 'package:project_5/pages/navbar.dart';
import 'package:project_5/services/setup.dart';
import 'package:google_fonts/google_fonts.dart';

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
            textTheme: GoogleFonts.interTextTheme(Theme.of(context).textTheme)),
        home: getIt.get<LoginData>().checkLogin()
            ? const Navbar()
            : const LoginScreen());
  }
}
