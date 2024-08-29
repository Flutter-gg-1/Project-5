import 'package:flutter/material.dart';
import '../bottom_tab_bar_view.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text('Login'),
            ElevatedButton(onPressed: () => (), child: BottomTabBarView()),
          ],
        ),
      )),
    );
  }
}
