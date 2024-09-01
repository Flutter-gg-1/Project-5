import 'package:blog_app/helper/extension/color_ext.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FeedCard extends StatelessWidget {
  const FeedCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(clipBehavior: Clip.none, children: [
      SizedBox(width: 600, child: Image.asset("assets/image_feed.png")),
      Positioned(top: 20, left: 200, child: Image.asset("assets/Frame.png")),
      Positioned(
        bottom: 40,
        left: 30,
        child: Text(
          "DJI • Jul 10, 2023",
          style: GoogleFonts.inter(
              fontSize: 10, fontWeight: FontWeight.w500, color: ColorExt.grey),
        ),
      ),
      Positioned(
        bottom: 15,
        left: 30,
        child: Text(
          "A month with DJI Mini 3 Pro",
          style: GoogleFonts.inter(
              fontSize: 16, fontWeight: FontWeight.bold, color: ColorExt.white),
        ),
      ),
      Positioned(
          bottom: 20,
          right: 30,
          child: Icon(
            Icons.arrow_outward_rounded,
            color: ColorExt.white,
          )),
    ]);
  }
}
