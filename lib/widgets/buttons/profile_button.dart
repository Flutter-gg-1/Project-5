import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:project5/data/all_users.dart';
import 'package:project5/screens/login_screen.dart';

class ProfileButton extends StatelessWidget {
  final String buttonName;
  final Color buttonNameColor;
  const ProfileButton({super.key, required this.buttonName, required this.buttonNameColor});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 255,
      height: 50,
      child: ElevatedButton(
        style: ButtonStyle(
          shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius:BorderRadius.circular(5))),
          backgroundColor: const WidgetStatePropertyAll(Colors.white)
        ),
        onPressed: () {
          GetIt.I.get<AllUsers>().currentUser = null;
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const LoginScreen()),
            (predicate) => false
          );
        },
        child: Text(
          buttonName,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w800,
            color: buttonNameColor
          ),
        )
      ),
    );
  }
}