import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GustRowWidget extends StatelessWidget {
  const GustRowWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          width: 30,
          child: Divider(
            // thickness: 3,
            color: Colors.white,
          ),
        ),
    
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text("Enter as a guest", style: GoogleFonts.inter(color: Colors.white, fontWeight: FontWeight.bold)),
        ),
        const SizedBox(
          width: 30,
          child: Divider(
            // thickness: 3,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
