import 'package:flutter/material.dart';

class LoginTextField extends StatelessWidget {
  final String inputName;
  final String inputHint;
  final TextEditingController controller;
  const LoginTextField({super.key, required this.inputName, required this.inputHint, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          inputName,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          )
        ),
        const SizedBox(height: 8,),
        SizedBox(
          height: 41,
          width: 303,
          child: TextField(
            obscureText: inputName == 'Password' ? true : false,
            controller: controller,
            style: const TextStyle(color: Colors.white),
            onTapOutside: (e) => FocusManager.instance.primaryFocus?.unfocus(),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white.withOpacity(0.12),
              border: OutlineInputBorder(borderSide: BorderSide.none,borderRadius: BorderRadius.circular(8)),
              hintText: inputHint,
              hintStyle: const TextStyle(
                color: Color(0xffB8B8B8),
                fontSize: 14,
                fontWeight: FontWeight.w500
              ),
            ),
          ),
        ),
      ],
    );
  }
}