import 'package:blog_app/helper/extension/color_ext.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class NewsCard extends StatelessWidget {
  final String category;
  final String title;
  final String writer;
  final String readingMinutes;
  final String date;
  final String summary;
  final String content;
  const NewsCard(
      {super.key,
      required this.category,
      required this.title,
      required this.writer,
      required this.readingMinutes,
      required this.date,
      required this.summary,
      required this.content});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.account_tree_outlined,
                color: ColorExt.violet,
                size: 15,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                category,
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: ColorExt.violet,
                ),
              )
            ],
          ),
          const SizedBox(
            width: 100,
          ),
          Text(
            "$title!",
            style: GoogleFonts.inter(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: ColorExt.white,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          SizedBox(height: 30, child: Image.asset("assets/useImage.png")),
          const SizedBox(height: 8),
          Text(
            writer,
            style: GoogleFonts.inter(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: ColorExt.grey,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "$readingMinutes•$date",
            style: GoogleFonts.inter(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: ColorExt.greyOpc,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Icon(
                FontAwesomeIcons.facebook,
                color: ColorExt.white,
                size: 20,
              ),
              const SizedBox(
                width: 20,
              ),
              Icon(
                FontAwesomeIcons.twitter,
                color: ColorExt.white,
                size: 20,
              ),
              const SizedBox(
                width: 20,
              ),
              Icon(
                FontAwesomeIcons.link,
                color: ColorExt.white,
                size: 20,
              ),
            ],
          ),
          const SizedBox(
            height: 45,
          ),
          Text(
            "Summary",
            style: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: ColorExt.white,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            summary,
            style: GoogleFonts.inter(
              fontSize: 16,
              color: ColorExt.white,
            ),
          ),
          const SizedBox(height: 40),
          Text(
            "Content",
            style: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: ColorExt.white,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            content,
            style: GoogleFonts.inter(
              fontSize: 16,
              color: ColorExt.white,
            ),
          ),
        ],
      ),
    );
  }
}
