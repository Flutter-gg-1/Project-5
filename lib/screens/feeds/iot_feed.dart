import 'package:blog_app/data_layer/get_blog.dart';
import 'package:blog_app/helper/nav.dart';
import 'package:blog_app/helper/screen.dart';
import 'package:blog_app/screens/artical_screen.dart';
import 'package:blog_app/widget/high_lights.dart';
import 'package:blog_app/widget/story_card.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class IotFeed extends StatefulWidget {
  const IotFeed({
    super.key,
  });

  @override
  State<IotFeed> createState() => _IotFeed();
}

class _IotFeed extends State<IotFeed> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
         SizedBox(
            width: context.getWidth(),
            height: context.getHight(value: .2),
            child: CarouselSlider(
              items: GetIt.I
                  .get<GetBlog>()
                  .blogs
                  .where((blog) => blog.category == "iot")
                  .toList()
                  .map((element) {
                return HighLights(
                    onPressed: () {
                      context.navTo(ArticalScreen(
                        blog: element,
                      ));
                    },
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
                .where((blog) => blog.category == "iot")
                .length,
            itemBuilder: (context, index) {
              final iot = GetIt.I
                  .get<GetBlog>()
                  .blogs
                  .where((blog) => blog.category == "iot")
                  .toList();
              final blog = iot[index];
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
