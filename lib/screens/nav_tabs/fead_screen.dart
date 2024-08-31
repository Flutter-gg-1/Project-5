import 'package:blog_app/data_layer/get_blog.dart';
import 'package:blog_app/helper/nav.dart';
import 'package:blog_app/screens/artical_screen.dart';
import 'package:blog_app/widget/high_lights.dart';
import 'package:blog_app/widget/story_card.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class FeadScreen extends StatefulWidget {
  const FeadScreen({
    super.key,
  });
  @override
  State<FeadScreen> createState() => _FeadScreenState();
}

class _FeadScreenState extends State<FeadScreen> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return const TabBarView(
      children: [
        FeedContet(),
      ],
    );
  }
}

class FeedContet extends StatefulWidget {
  const FeedContet({
    super.key,
  });

  @override
  State<FeedContet> createState() => _FeedContetState();
}

class _FeedContetState extends State<FeedContet> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const HighLights(
            date: "Jul 10, 2023",
            title: "A month with DJI Mini 3 Pro",
            writer: "DJI",
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Top Stories", style: TextStyle(fontSize: 19)),
                  TextButton(onPressed: () {}, child: const Text("See all"))
                ],
              ),
            ),
          ),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: GetIt.I.get<GetBlog>().blogs.length,
            itemBuilder: (context, index) {
              return StoryCard(
                onTap: () {
                  context.navTo(ArticalScreen(
                    blog: GetIt.I.get<GetBlog>().blogs[index],
                  ));
                },
                writer: GetIt.I.get<GetBlog>().blogs[index].authorName,
                title: GetIt.I.get<GetBlog>().blogs[index].title,
                date: GetIt.I.get<GetBlog>().blogs[index].date,
                min: GetIt.I.get<GetBlog>().blogs[index].minutesToRead,
                bookMark: GetIt.I.get<GetBlog>().blogs[index].saved
                    ? const Icon(Icons.bookmark)
                    : const Icon(Icons.bookmark_border),
                onPressed: () {
                  GetIt.I
                      .get<GetBlog>()
                      .editBookMark(GetIt.I.get<GetBlog>().blogs[index]);

                  setState(() {});
                },
              );
            },
          )
        ],
      ),
    );
  }
}
