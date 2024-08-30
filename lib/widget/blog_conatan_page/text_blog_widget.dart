import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextBlogWidget extends StatelessWidget {
  const TextBlogWidget({
    super.key, required this.text,
  });


  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: SizedBox(
        width: 330,
        child: Text(
          text,
          style: GoogleFonts.inter(
              color: const Color(0xffB8B8B8),
              fontSize: 14,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}