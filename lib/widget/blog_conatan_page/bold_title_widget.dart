import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BoldTitleWidget extends StatelessWidget {
  const BoldTitleWidget({
    super.key, required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Text(
        text,
        style: GoogleFonts.inter(
            color: const Color(0xffE8E8E8),
            fontSize: 16,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}