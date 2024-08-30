import 'package:blog_app/styles/colours.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Welcome Back!',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colours.textPrimary),
          ),
          const Text(
            'Glad to see you again',
            style: TextStyle(fontSize: 15, color: Colours.textPrimary),
          ),
          Container(
            color: Colours.surfaceTertiary,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Username',
                  style: TextStyle(fontSize: 14, color: Colours.iconPrimary),
                ),
                Container(
                  color: Colours.chipPrimary,
                  child: TextField(
                    controller: nameController,
                  ),
                ),
                const Text(
                  'Password',
                  style: TextStyle(fontSize: 14, color: Colours.iconPrimary),
                ),
                Container(
                    color: Colours.chipPrimary,
                    child: TextField(
                      controller: passwordController,
                    )),
                TextButton(
                    onPressed: () {},
                    child: const Text(
                      'forgot password?',
                      style:
                          TextStyle(fontSize: 10, color: Colours.accentPurple),
                    )),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color(0xffBDA6F5).withOpacity(0.71)),
                    onPressed: () {},
                    child: const Text(
                      'Login',
                      style:
                          TextStyle(fontSize: 14, color: Colours.iconPrimary),
                    )),
                TextButton(
                    onPressed: () {},
                    child: const Text(
                      '--- Enter as a guest ---',
                      style:
                          TextStyle(fontSize: 12, color: Colours.textPrimary),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
