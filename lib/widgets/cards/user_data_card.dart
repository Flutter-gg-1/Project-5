import 'package:blog_app/helper/extension/color_ext.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserDataCard extends StatelessWidget {
  const UserDataCard({super.key, required this.name});
  final String name;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Card(
        color: ColorExt.background,
        child: ListTile(
          leading: Image.asset("assets/Icon.png"),
          title: Text(
            name,
            style: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: ColorExt.greyOpc,
            ),
          ),
          subtitle: Text(
            "Software developer",
            style: GoogleFonts.inter(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: ColorExt.greyOpc,
            ),
          ),
        ),
      ),
    );
  }
}
