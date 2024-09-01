import 'package:blog_app/data_layer/user_data.dart';
import 'package:blog_app/helper/extension/color_ext.dart';
import 'package:blog_app/models/blog_model.dart';
import 'package:blog_app/screens/edit_news_screen.dart';
import 'package:blog_app/widgets/cards/news_card.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class FullNewsScreen extends StatelessWidget {
  final BlogModel blog;

  const FullNewsScreen({
    super.key,
    required this.blog,
  });

  @override
  Widget build(BuildContext context) {
    final userData = GetIt.I.get<UserData>();
    final isCurrentUserWriter = userData.currentUser?.userName == blog.writer;

    return Scaffold(
      backgroundColor: ColorExt.background,
      appBar: AppBar(
        backgroundColor: ColorExt.leaden,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: ColorExt.white,
            size: 20,
          ),
        ),
        actions: [
          if (isCurrentUserWriter)
            IconButton(
              icon: Icon(
                Icons.edit,
                color: ColorExt.white,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditNewsScreen(blog: blog),
                  ),
                );
              },
            ),
          Icon(
            Icons.text_fields_rounded,
            color: ColorExt.white,
          ),
          const SizedBox(width: 10),
          Icon(
            Icons.bookmark_border,
            color: ColorExt.white,
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 250,
            child: Image.asset(
              blog.image,
              fit: BoxFit.cover,
            ),
          ),
          NewsCard(
            category: blog.category,
            writer: blog.writer,
            content: blog.content,
            title: blog.title,
            readingMinutes: blog.readingMinutes,
            date: blog.date,
            summary: blog.summary,
          ),
        ],
      ),
    );
  }
}
