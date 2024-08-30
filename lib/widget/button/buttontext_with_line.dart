
import 'package:flutter/material.dart';

class ButtonWithLines extends StatelessWidget {
    final Function()? onPressed;
    final String text;
  const ButtonWithLines({
    super.key, this.onPressed, required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child:  Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
              width: 40,
              child: Divider(
                color: Colors.white,
                thickness: 2,
              )),
          Text(
            '   $text   ',
            style: const TextStyle(color: Colors.white),
          ),
          const SizedBox(
              width: 40,
              child: Divider(
                color: Colors.white,
                thickness: 2,
              )),
        ],
      ),
    );
  }
}
