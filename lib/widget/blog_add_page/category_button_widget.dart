import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryButtonWidget extends StatelessWidget {
   const CategoryButtonWidget({
    super.key,
    required this.tex,
    required this.isSlected, required this.onTap
  });

  final String tex;

  final VoidCallback onTap;

  final bool isSlected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4), color: isSlected ? Color(0xffFFFFFF) : Color(0xff2C2C2C)),
        child: Text(
          tex,
          style: GoogleFonts.inter(
              color: isSlected ? const Color(0xffA48BE2) : Color(0xff595959),
              fontWeight: FontWeight.bold,
              fontSize: 14),
        ),
      ),
    );
  }
}
