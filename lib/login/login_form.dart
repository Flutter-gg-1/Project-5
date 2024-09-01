import 'package:flutter/material.dart';
import 'package:project/User_task/user_task.dart';
import 'package:project/bottom_nav/bottom_nav.dart';
import 'package:project/login/text_field.dart';
import 'package:get_it/get_it.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final UserTask userTask = GetIt.I<UserTask>();
    final TextEditingController usernameController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Container(
      width: 337,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xff1E1E1E),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Username',
            style: TextStyle(color: Colors.white, fontSize: 19),
          ),
          const SizedBox(height: 8),
          CustomTextField(
            hintText: 'Enter your username',
            controller: usernameController,
          ),
          const SizedBox(height: 16),
          const Text(
            'Password',
            style: TextStyle(color: Colors.white, fontSize: 19),
          ),
          const SizedBox(height: 8),
          CustomTextField(
            hintText: 'Enter your password',
            obscureText: true,
            controller: passwordController,
          ),
          Align(
            alignment: Alignment.topRight,
            child: TextButton(
              onPressed: () {},
              child: const Text(
                'Forget password?',
                style: TextStyle(color: Color(0xffa08dd1)),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xffa08dd1),
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 60,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {
                final String username = usernameController.text;

                userTask.login(username);

                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const BottomNav()),
                );
              },
              child: const Text(
                'Login',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Align(
            alignment: Alignment.center,
            child: Text(
              "________  Enter as a guest __________",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
