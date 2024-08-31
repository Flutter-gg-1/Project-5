import 'package:blog_app_project/helper/extensions/screen.dart';
import 'package:flutter/material.dart';

class CustomTextFormFelid extends StatelessWidget {
  const CustomTextFormFelid(
      {super.key,
      this.controller,
      this.minLines = 1,
      this.content,
      this.hinttext});
  final TextEditingController? controller;
  final int? minLines;
  final String? content;
  final String? hinttext;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: const Color(0xffffffff).withOpacity(0.01)),
      constraints: BoxConstraints(maxWidth: context.getWidth()),
      width: context.getWidth(divide: 1),
      child: TextFormField(
        initialValue: content,
        style: const TextStyle(color: Colors.white),
        minLines: minLines,
        maxLines: (minLines!),
        controller: controller,
        decoration: InputDecoration(
          border: UnderlineInputBorder(borderRadius: BorderRadius.circular(8)),
          filled: true,
          hintText: hinttext,
          fillColor: const Color(0xffffffff).withOpacity(0.12),
        ),
      ),
    );
  }
}
