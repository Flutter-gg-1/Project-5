import 'package:blog_app/data/post_data.dart';
import 'package:blog_app/data/user_data.dart';
import 'package:blog_app/screens/news_screen.dart';
import 'package:blog_app/services/setup.dart';
import 'package:blog_app/widgets/cards/post_widget.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class SavedScreen extends StatefulWidget {
  const SavedScreen({super.key});

  @override
  State<SavedScreen> createState() => _SavedScreenState();
}

class _SavedScreenState extends State<SavedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff111111),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xff111111),
        bottom: AppBar(
          titleTextStyle: const TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          title: const Text("Saved News"),
          automaticallyImplyLeading: false,
          backgroundColor: const Color(0xff111111),
        ),
      ),
      body: Center(
          child: box.read("token") != null
              ? Column(
                  children: GetIt.I.get<UserData>().users.first.savedPostes ==
                          null
                      ? ([
                          const Center(
                              child: Text("No blogs saved",
                                  style: TextStyle(
                                      color: Color(0xffB8B8B8), fontSize: 20)))
                        ])
                      : GetIt.I
                          .get<UserData>()
                          .users
                          .first
                          .savedPostes!
                          .map((e) => PostWidget(
                              onSave: () {
                                GetIt.I.get<PostData>().addToSaved(id: e.id);
                                setState(() {});
                              },
                              image: e.image,
                              title: e.title,
                              subTitle: e.auther,
                              date: e.date,
                              min: e.minutes,
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => NewsScreen(
                                            title: e.title,
                                            category: e.category,
                                            content: e.content,
                                            summary: e.summary,
                                            date: e.date,
                                            image: e.image,
                                            min: e.minutes,
                                            userAvatar: e.userAvatar,
                                          )))))
                          .toList(),
                )
              : const Center(
                  child: Text("you need to login to save blogs",
                      style:
                          TextStyle(color: Color(0xffB8B8B8), fontSize: 15)))),
    );
  }
}
