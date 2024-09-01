import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vlog_project/screens/User_Screens/user_home_screen.dart';
import 'package:vlog_project/helper/constants.dart';
import 'package:vlog_project/screens/auth/log_in_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final box = GetStorage();

  @override
  void initState() {
    super.initState();

    // Delaying the redirection to simulate a splash screen effect
    Future.delayed(const Duration(seconds: 2), _checkLoginStatus);
  }

  void _checkLoginStatus() {
    bool isLoggedIn = box.read(Constants.loggedInKey) ?? false;

    if (isLoggedIn) {
      // If the user is logged in, navigate to UserHomeScreen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) =>  UserHomeScreen()),
      );
    } else {
      // If the user is not logged in, navigate to LogInScreen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LogInScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff111111),
      body: const Center(
        child: CircularProgressIndicator(
          color: Colors.white,
        ),
      ),
    );
  }
}
