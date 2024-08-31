import 'package:flutter/material.dart';

class InfoFeild extends StatelessWidget {
  const InfoFeild({
    super.key,
    required this.title,
    required this.hint,
    this.controller,
    this.minLines = 1,
  });
  final String title;
  final String hint;
  final TextEditingController? controller;
  final int? minLines;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              title,
              style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const SizedBox(width: 3),
            const Text("*", style: TextStyle(color: Colors.red))
          ],
        ),
        const SizedBox(height: 8),
        TextFormField(
          style: const TextStyle(color: Colors.white),
          minLines: minLines,
          maxLines: (minLines!),
          controller: controller,
          decoration: InputDecoration(
              focusColor: Colors.white,
              hintStyle: const TextStyle(
                  color: Color(0xffB8B8B8),
                  fontWeight: FontWeight.w400,
                  fontSize: 14),
              hintText: hint,
              border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  borderSide: BorderSide.none),
              filled: true,
              fillColor: const Color.fromARGB(255, 60, 60, 60)),
        ),
      ],
    );
  }
}
