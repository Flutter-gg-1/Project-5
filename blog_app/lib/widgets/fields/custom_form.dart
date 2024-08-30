import 'package:flutter/material.dart';

class CustomForm extends StatelessWidget {
  const CustomForm(
      {super.key,
      required this.label,
      required this.hint,
      required this.controller});
  final String label;
  final String hint;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: const TextStyle(
                fontWeight: FontWeight.w400,
                color: Colors.white,
                fontSize: 14)),
        const SizedBox(height: 10),
        SizedBox(
          height: 41,
          width: 303,
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
                hintStyle: const TextStyle(
                    color: Color(0xffB8B8B8),
                    fontWeight: FontWeight.w400,
                    fontSize: 14),
                hintText: hint,
                border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    borderSide: BorderSide.none),
                filled: true,
                fillColor: const Color.fromARGB(12, 255, 255, 255)),
          ),
        ),
      ],
    );
  }
}
