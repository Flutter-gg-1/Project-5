import 'package:blog_app/helper/extension/color_ext.dart';
import 'package:blog_app/widgets/buttons/custom_button.dart';
import 'package:blog_app/widgets/text_felid/custom_text_felid.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginCard extends StatelessWidget {
  const LoginCard({
    super.key,
    required this.customButton,
    required this.userNameFelid,
    required this.passwordFelid,
    required this.onTapGuest,
  });

  final CustomButton customButton;
  final CustomTextFelid userNameFelid;
  final CustomTextFelid passwordFelid;
  final Function()? onTapGuest;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 360,
      width: 350,
      padding: const EdgeInsets.only(left: 16, right: 16, top: 37, bottom: 20),
      margin: const EdgeInsets.symmetric(vertical: 31),
      decoration: BoxDecoration(
          color: ColorExt.leaden, borderRadius: BorderRadius.circular(8)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          userNameFelid,
          passwordFelid,
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              "forget password",
              style: GoogleFonts.inter(
                fontSize: 11,
                color: ColorExt.violet,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          customButton,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 32,
                child: Divider(
                  color: ColorExt.white,
                  thickness: 1,
                ),
              ),
              const SizedBox(width: 8),
              GestureDetector(
                onTap: onTapGuest,
                child: Text(
                  "Enter as a guest",
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    color: ColorExt.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              SizedBox(
                width: 32,
                child: Divider(
                  color: ColorExt.white,
                  thickness: 1,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
