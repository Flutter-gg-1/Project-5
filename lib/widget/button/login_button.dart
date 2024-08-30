import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
     this.onPressed,
  });

  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return FilledButton(
      style: ButtonStyle(
        shape: WidgetStateProperty.all(
          const BeveledRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(4),
            ),
          ),
        ),
      ),
      onPressed: onPressed,
      child: const Text(
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          "Log in"),
    );
  }
}
