import 'package:flutter/material.dart';

class SignInButton extends StatelessWidget {
  const SignInButton({super.key, this.onPressed});
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          fixedSize: const Size(173, 35),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          backgroundColor: const Color(0xffBDA6F5),
        ),
        onPressed: onPressed,
        child: const Text("Login"));
  }
}
