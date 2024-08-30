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
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            appBarTheme: AppBarTheme(backgroundColor: Colours.surfacePrimary),
            scaffoldBackgroundColor: Colours.surfacePrimary),
        home: NewsScreen(
          post: Post(
              title:
                  'Now Google’s Bard AI Chatbot can talk & respond to visual prompts!',
              summary:
                  'Google is adding some new features to its Bard AI chatbot, including the ability for Bard to speak its answers to you and for it to respond to prompts that also include images. The chatbot is also now available in much of the world, including the EU.In a blog post, Google is positioning Bard’s spoken responses as a helpful way to “correct ',
              content:
                  'The feature that lets you add images to prompts is something that Google first showed off at its I/O conference in May. In one example, Google suggested you could use this to ask for help writing a funny caption about a picture of two dogs. Google says the feature is now available in English and is expanding to new languages “soon.”Google is introducing a few other new features, too, including the ability to pin and rename conversations, share responses with your friends, and change the tone and style of the responses you get back from Bard.Google first opened up access to Bard in March, but at the time, it was available only in the US and the UK. The company has been rolling out the chatbot to many more countries since then, and that now includes “all countries in the EEA [European Economic Area] and Brazil,” Google spokesperson Jennifer Rodstrom tells The Verge. That expansion in Europe is a notable milestone; ',
              category: 'category',
              readingMinutes: 5,
              author: 'Kyle Barr',
              dateCreated: 'Jul 13, 2023'),
        ));
  }
}
