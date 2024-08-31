import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:project5/data/all_users.dart';
import 'package:project5/screens/user_screen_navigator.dart';
import 'package:project5/widgets/alert_dialogs/error_alert_dialog.dart';

class LoginButton extends StatelessWidget {
  final TextEditingController usernameController;
  final TextEditingController passwordController;
  const LoginButton({super.key, required this.usernameController, required this.passwordController});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 173,
      height: 35,
      child: ElevatedButton(
        style: ButtonStyle(
        shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
        backgroundColor: WidgetStatePropertyAll(const Color(0xffBDA6F5).withOpacity(0.71))),
        onPressed: () {
          if(usernameController.text.isNotEmpty && passwordController.text.isNotEmpty) {
            bool checkLogin = GetIt.I.get<AllUsers>().setCurrentUser(username: usernameController.text, password: passwordController.text);
            checkLogin ?
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context)=>const UserScreenNavigator()),
              (predicate) => false,
            )
            : showDialog(
              context: context,
              builder: (context) => const ErrorAlertDialog(message:"Wrong Username or Password")
            );
          }
          else {
            showDialog(
              context: context,
              builder: (context) => const ErrorAlertDialog(message:"Invalid Input")
            );
          }
        },
        child: const Text(
          "Login",
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.bold
          ),
        )
      ),
    );
  }
}