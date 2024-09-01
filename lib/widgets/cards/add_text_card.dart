import 'package:blog_app/helper/extension/color_ext.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddTextCard extends StatelessWidget {
  final String name;
  const AddTextCard({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 32,
        ),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: name,
                style: GoogleFonts.inter(
                  fontSize: 17,
                  color: ColorExt.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text: " *",
                style: GoogleFonts.inter(
                  fontSize: 17,
                  color: ColorExt.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
