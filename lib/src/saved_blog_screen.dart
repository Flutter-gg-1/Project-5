import 'package:blog_app/data_layer/blog_data.dart';
import 'package:blog_app/widget/card/blog_card.dart';
import 'package:blog_app/widget/text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class SavedBlogScreen extends StatelessWidget {
  const SavedBlogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
      child: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomText(
            text: 'Saved News',
            fontSize: 20,
          ),
          SingleChildScrollView(
            child: Column(
              children: GetIt.I
                  .get<BlogData>()
                  .markedBlogs
                  .map(
                    (e) => BlogCard(
                        writer: e.writer,
                        title: e.title,
                        timeToRead: e.time,
                        creationDate: e.creationDate,
                        isFaveiorte: e.isFaveiorte,
                        category: e.category,
                        summary: e.summary,
                        content: e.content,
                        id: e.id),
                  )
                  .toList(),
            ),
          )
        ],
      )),
    );
  }
}
