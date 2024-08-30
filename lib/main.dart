import 'package:blog_app/models/post.dart';
import 'package:blog_app/screens/add_post_screen.dart';
import 'package:blog_app/screens/edit_post_screen.dart';
import 'package:blog_app/screens/home_screen.dart';
import 'package:blog_app/screens/login_screen.dart';
import 'package:blog_app/screens/news_screen.dart';
import 'package:flutter/material.dart';

import 'styles/colours.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colours.surfacePrimary
        ),
        scaffoldBackgroundColor: Colours.surfacePrimary),
      home: NewsScreen(post: Post(title: 'title', summary: 'summary', content: 'content', category: 'category', readingMinutes: 5, author: 'Kyle Barr'),)
    );
  }
}
