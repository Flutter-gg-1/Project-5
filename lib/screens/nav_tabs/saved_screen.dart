import 'package:blog_app/data_layer/get_blog.dart';
import 'package:blog_app/widget/button/divider/custom_dvider.dart';
import 'package:blog_app/widget/story_card.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class SavedScreen extends StatelessWidget {
  const SavedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const Align(
            alignment: Alignment.topLeft,
            child: Text("Saved News"),
          ),
          const CustomDivider(height: 30),
          GetIt.I.get<GetBlog>().blogs.any((blog) => blog.saved)
              ? ListView.builder(
                  shrinkWrap: true,
                  itemCount: GetIt.I.get<GetBlog>().blogs.length,
                  itemBuilder: (context, index) {
                    return GetIt.I.get<GetBlog>().blogs[index].saved
                        ? StoryCard(
                            writer:
                                GetIt.I.get<GetBlog>().blogs[index].authorName,
                            title: GetIt.I.get<GetBlog>().blogs[index].title,
                            date: GetIt.I.get<GetBlog>().blogs[index].date,
                            min: GetIt.I
                                .get<GetBlog>()
                                .blogs[index]
                                .minutesToRead,
                            bookMark: GetIt.I.get<GetBlog>().blogs[index].saved
                                ? const Icon(Icons.bookmark)
                                : const Icon(Icons.bookmark_border),
                          )
                        : null;
                  },
                )
              : const Center(
                  child: Text("No news found"),
                ),
        ],
      ),
    );
  }
}
