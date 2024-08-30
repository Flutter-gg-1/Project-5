import 'package:blog_app/helper/extensions/nav.dart';
import 'package:blog_app/screens/signin_screen.dart';
import 'package:blog_app/services/setup.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              box.remove("token");
              context.navTo(page: const SigninScreen());
            },
            child: const Text("logout")),
      ),
    );
  }
}
