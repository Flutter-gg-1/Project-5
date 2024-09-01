import 'package:blog_app/data_layer/blog_data.dart';
import 'package:blog_app/data_layer/user_data.dart';
import 'package:blog_app/helper/extension/color_ext.dart';
import 'package:blog_app/helper/extension/nav.dart';
import 'package:blog_app/models/blog_model.dart';
import 'package:blog_app/screens/news_screen.dart';
import 'package:blog_app/widgets/cards/top_stories_card.dart';
import 'package:blog_app/widgets/cards/feed_image_card.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';

class TabBarViewContaint extends StatefulWidget {
  const TabBarViewContaint({super.key});

  @override
  State<TabBarViewContaint> createState() => _TabBarViewContaintState();
}

class _TabBarViewContaintState extends State<TabBarViewContaint> {
  late UserData userData;
  late BlogData blogData;

  @override
  void initState() {
    super.initState();
    userData = GetIt.I.get<UserData>();
    blogData = GetIt.I.get<BlogData>();
    if (userData.currentUser != null) {
      userData.loadSavedBlogs();
    }
    _loadBlogs();
  }

  Future<void> _loadBlogs() async {
    await blogData.refreshBlogs();
    setState(() {});
  }

  void _toggleSave(BlogModel blog) async {
    if (userData.currentUser == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please log in to save blogs.'),
        ),
      );
      return;
    }

    if (userData.isBlogSaved(blog)) {
      await userData.removeBlog(blog);
    } else {
      await userData.saveBlog(blog);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final blogs = blogData.blogData;

    return Padding(
      padding: const EdgeInsets.all(8),
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
                  color: ColorExt.white,
                ),
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
          ...blogs.map((blog) {
            return TopStoriesCard(
              blog: blog,
              onSave: () => _toggleSave(blog),
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
          })
        ],
      ),
    );
  }
}
