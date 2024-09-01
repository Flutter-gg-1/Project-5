import 'package:blog_app/helper/extension/color_ext.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextFelid extends StatelessWidget {
  const CustomTextFelid(
      {super.key,
      this.title,
      this.controller,
      required this.hint,
      this.minLins = 1,
      this.validator});

  final String? title;
  final String hint;
  final String? Function(String?)? validator;
  final int? minLins;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null)
          Text(
            title!,
            style: GoogleFonts.inter(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: ColorExt.white,
            ),
          ),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
            style: GoogleFonts.inter(
              fontSize: 14,
              color: ColorExt.white,
            ),
            controller: controller,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            minLines: minLins,
            maxLines: 10,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              fillColor: ColorExt.textField,
              filled: true,
              hintText: hint,
              hintStyle: GoogleFonts.inter(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: ColorExt.grey),
            ),
            validator: validator),
      ],
    );
  }
}
