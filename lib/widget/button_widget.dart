import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
    required this.onPressed,  this.backColor = const Color(0xffBDA6F5) ,  this.texcolor =  const Color(0xffFFFFFF)  ,  this.tex = "Login",  this.opacity =1,
  });

  final  void Function()? onPressed;

  final Color backColor;
  final Color texcolor;
  final  String tex;
  final  double opacity;

  

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      width: 170,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor:  backColor.withOpacity(opacity),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5))),
        onPressed: onPressed,
        child: Text(
          tex,
          style: GoogleFonts.inter(color: texcolor,fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
