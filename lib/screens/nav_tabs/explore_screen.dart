import 'package:blog_app/data_layer/get_blog.dart';
import 'package:blog_app/helper/nav.dart';
import 'package:blog_app/screens/artical_screen.dart';
import 'package:blog_app/widget/button/textfield/custom_text_form_field.dart';
import 'package:blog_app/widget/story_card.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  TextEditingController search = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: CustomTextFormField(
            hintText: "Search for News by title",
            onChanged: (value) {
              setState(() {});
            },
            userTextcontroller: search,
            obscure: false,
          ),
        ),
        search.text.isEmpty
            ? Container(
                margin: const EdgeInsets.only(top: 100),
                child: const Center(
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.search),
                        Text("Search for a news")
                      ]),
                ),
              )
            : Container(
                margin: const EdgeInsets.only(top: 100),
                child: SingleChildScrollView(
                  child: Column(
                      children: GetIt.I.get<GetBlog>().blogs.map((blog) {
                    return blog.content.contains(search.text)
                        ? StoryCard(
                            onTap: () {
                              context.navTo(ArticalScreen(
                                blog: blog,
                              ));
                            },
                            writer: blog.authorName,
                            title: blog.title,
                            date: blog.date,
                            min: blog.minutesToRead,
                            bookMark: blog.saved
                                ? const Icon(Icons.bookmark)
                                : const Icon(Icons.bookmark_border),
                            onPressed: () {
                              GetIt.I.get<GetBlog>().editBookMark(blog);

                              setState(() {});
                            },
                          )
                        : const SizedBox();
                  }).toList()),
                )),
      ],
    ));
  }
}
