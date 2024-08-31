import 'package:blog_app/data_layer/blog_data.dart';
import 'package:blog_app/data_layer/user_data.dart';
import 'package:blog_app/helper/extension/color_ext.dart';
import 'package:blog_app/helper/extension/nav.dart';
import 'package:blog_app/screens/news_screen.dart';
import 'package:blog_app/widgets/cards/feed_image_card.dart';
import 'package:blog_app/widgets/cards/top_stories_card.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';

class TabBarViewContaint extends StatelessWidget {
  const TabBarViewContaint({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: ListView(
        children: [
          const FeedCard(),
          Divider(
            color: ColorExt.greyOpc,
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Top Stories",
                style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: ColorExt.white),
              ),
              Text(
                "See all",
                style: GoogleFonts.inter(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: ColorExt.grey,
                ),
              ),
            ],
          ),
          ...blogData.map((blog) {
            final userData = GetIt.I.get<UserData>();
            final isSaved = userData.isBlogSaved(blog);

            return TopStoriesCard(
              blog: blog,
              onSave: () {
                if (isSaved) {
                  userData.removeBlog(blog);
                } else {
                  userData.saveBlog(blog);
                }
              
              },
              writer: blog.writer,
              image: blog.image,
              title: blog.title,
              date: '${blog.date} • ${blog.readingMinutes}',
              onTap: () {
                context.push(
                  screen: FullNewsScreen(
                    blog: blog,
                  ),
                );
              },
            );
          }).toList(),]
      ),
    );
  }
}
