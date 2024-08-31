import 'package:flutter/material.dart';
import 'package:project_5/components/stories/stories.dart';
import 'package:project_5/components/text/text_custom.dart';
import 'package:project_5/data_layer/blog_data.dart';
import 'package:project_5/pages/blog_page.dart';
import 'package:project_5/services/setup.dart';

class SavedPage extends StatefulWidget {
  const SavedPage({super.key});

  @override
  State<SavedPage> createState() => _SavedPageState();
}

class _SavedPageState extends State<SavedPage> {
  @override
  Widget build(BuildContext context) {
    final favoritePages =
        getIt.get<BlogData>().blogs.where((e) => e.isFavorite!).toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff111111),
        title: const TextCustom(
            text: "Saved News",
            color: Colors.white,
            weight: FontWeight.w700,
            fontSize: 20),
      ),
      backgroundColor: const Color(0xff111111),
      body: SafeArea(
          child: favoritePages.isEmpty
              ? const Center(
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextCustom(
                            text: "No news found",
                            color: Color(0xffB8B8B8),
                            weight: FontWeight.w400,
                            fontSize: 20)
                      ],
                    ),
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: favoritePages
                        .map((e) => Stories(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => BlogPage(
                                              selectedId: e.id,
                                            ))).then((onValue) {
                                  if (onValue != null) {
                                    setState(() {});
                                  }
                                });
                              },
                              imagePath:
                                  "assets/STK156_Instagram_threads_2 2.png",
                              title: e.title,
                              subtitle: e.content,
                              date: e.date,
                              readTime: e.minutesToRead,
                              onPressed: () {
                                getIt.get<BlogData>().toggleFavorite(id: e.id);
                                setState(() {});
                              },
                              icon: e.isFavorite!
                                  ? Icons.bookmark
                                  : Icons.bookmark_border,
                            ))
                        .toList(),
                  ),
                )),
    );
  }
}
