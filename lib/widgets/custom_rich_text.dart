import 'package:blog_app/helper/extension/color_ext.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomRichText extends StatelessWidget {
  const CustomRichText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: GoogleFonts.inter(
          fontSize: 16,
          color: ColorExt.white,
        ),
        children: [
          const TextSpan(
            text: 'Google is adding some new features to its Bard AI chatbot, including the ability for ',
          ),
          TextSpan(
            text: 'Bard to speak its answers to you and for it to respond to prompts that also include images. ',
            style: TextStyle(
              decoration: TextDecoration.underline,
              decorationColor: ColorExt.white, 
              
            ),
          ),
          
          const TextSpan(
            text: ' The chatbot is also now available in much of the world, including the EU. In a blog post, Google is positioning',
          ),
          TextSpan(
            text: "Bard's spoken responses as a helpful way to “correct ",
            style: TextStyle(
              decoration: TextDecoration.underline,
              decorationColor: ColorExt.white, 
              
            ),
          ),
        ],
      ),
    );
  }
}
