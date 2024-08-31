import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextfieldWidget extends StatelessWidget {
  const TextfieldWidget({
    super.key, required this.hint,  this.texLine = 1,
  });

  final String hint;

  final int texLine;



  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: TextField(
        style: GoogleFonts.inter(color: Colors.white),
        
        minLines: texLine,
        maxLines: texLine+2,
        decoration: InputDecoration(
          
          
            hintText: hint,
            hintStyle: GoogleFonts.inter(color: const Color(0xffB8B8B8)),
            filled: true,
            fillColor: const Color(0xffFFFFFF).withOpacity(0.12),
            border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(8))),
      ),
    );
  }
}
