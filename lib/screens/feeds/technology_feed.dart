import 'package:blog_app/data_layer/get_blog.dart';
import 'package:blog_app/helper/nav.dart';
import 'package:blog_app/helper/screen.dart';
import 'package:blog_app/screens/artical_screen.dart';
import 'package:blog_app/widget/high_lights.dart';
import 'package:blog_app/widget/story_card.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:carousel_slider/carousel_slider.dart';

class TechnologyFeed extends StatefulWidget {
  const TechnologyFeed({
    super.key,
  });

  @override
  State<TechnologyFeed> createState() => _TechnologyFeed();
}

class _TechnologyFeed extends State<TechnologyFeed> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // const HighLights(
          //   date: "Jul 10, 2023",
          //   title: "A month with DJI Mini 3 Pro",
          //   writer: "DJI",
          // ),
          SizedBox(
            width: context.getWidth(),
            height: context.getHight(value: .2),
            child: CarouselSlider(
              items: GetIt.I
                  .get<GetBlog>()
                  .blogs
                  .where((blog) => blog.category == "technology")
                  .toList()
                  .map((element) {
                return HighLights(
                    date: element.date,
                    title: element.title,
                    writer: element.authorName,
                    imageSrc: element.imageSrc);
              }).toList(),
              options: CarouselOptions(
                autoPlay: false,
                enlargeCenterPage: true,
                viewportFraction: 0.9,
                aspectRatio: 2.0,
                initialPage: 3,
              ),
            ),
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
            itemCount: GetIt.I
                .get<GetBlog>()
                .blogs
                .where((blog) => blog.category == "technology")
                .length,
            itemBuilder: (context, index) {
              final technology = GetIt.I
                  .get<GetBlog>()
                  .blogs
                  .where((blog) => blog.category == "technology")
                  .toList();
              final blog = technology[index];
              return StoryCard(
                imageSrc: blog.imageSrc,
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
              );
            },
          ),
        ],
      ),
    );
  }
}
