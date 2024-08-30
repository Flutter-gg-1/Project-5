import 'package:flutter/material.dart';

class AddPostTextField extends StatelessWidget {
  final String inputName;
  final String inputHint;
  final TextEditingController controller;
  final int minLines;
  final int? maxLines;
  const AddPostTextField({super.key, required this.inputName, required this.inputHint, required this.controller, this.minLines=1, this.maxLines});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          inputName,
          style: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w700,
            color: Colors.white
          )
        ),
        const SizedBox(height: 7,),
        TextField(
          keyboardType: inputName.contains('minutes') ? TextInputType.number : null,
          controller: controller,
          minLines: minLines,
          maxLines: maxLines,
          style: const TextStyle(
            fontSize: 14,
            fontWeight:FontWeight.w400,
            color: Colors.white
          ),
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white.withOpacity(0.12),
            hintText: inputHint,
            hintStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Color(0xffb8b8b8)
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(8)
            ),
          ),
        )
      ],
    );
  }
}