import 'package:flutter/material.dart';

import 'package:blog_app/services/extensions/screen.dart';

import '../styles/colours.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final double heightFactor;
  const CustomTextField({
    super.key,
    required this.controller,
    required this.hint,
    required this.heightFactor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 7),
      child: Container(
          padding: const EdgeInsets.all(12),
          height: context.getHeight() / heightFactor,
          width: context.getWidth() / 1.103,
          color: Colours.chipPrimary,
          child: TextField(
            style: const TextStyle(color: Colours.textSecondary),
            cursorColor: Colours.textPrimary,
            maxLines: null,
            keyboardType: hint.contains('Minutes')
                ? const TextInputType.numberWithOptions()
                : TextInputType.multiline,
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: const TextStyle(color: Colours.textSecondary),
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
            ),
          )),
    );
  }
}
