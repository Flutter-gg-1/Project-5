import 'package:blog_app/data_layer/user_data.dart';
import 'package:blog_app/helper/extension/color_ext.dart';
import 'package:blog_app/models/blog_model.dart';
import 'package:blog_app/widgets/buttons/save_button.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';

class TopStoriesCard extends StatefulWidget {
  const TopStoriesCard(
      {super.key,
      required this.writer,
      required this.title,
      required this.image,
      required this.date,
      required this.blog,
    required this.onSave,
      required this.onTap});
  final String writer;
  final String title;
  final String image;
  final String date;
  final BlogModel blog;
  final Function()? onSave;
  final Function()? onTap;

  @override
  State<TopStoriesCard> createState() => _TopStoriesCardState();
}

class _TopStoriesCardState extends State<TopStoriesCard> {
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: widget.onTap,
        child: Card(
          margin: const EdgeInsets.only(top: 14),
          color: ColorExt.leaden,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              children: [
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    widget.writer,
                  ),
                  titleTextStyle: GoogleFonts.inter(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: ColorExt.grey,
                  ),
                  subtitle: Text(
                    widget.title,
                  ),
                  subtitleTextStyle: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: ColorExt.white,
                  ),
                  leading: Image.asset(widget.image),
                ),
                Row(
                  children: [
                    Text(
                      widget.date,
                      style: GoogleFonts.inter(
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        color: ColorExt.grey,
                      ),
                    ),
                    const Spacer(),
                    SaveButton(
                    isSaved: GetIt.I.get<UserData>().isBlogSaved(widget.blog),
                    onPressed: widget.onSave,
                  ),
                    Icon(
                      Icons.more_vert_sharp,
                      color: ColorExt.greyOpc,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
