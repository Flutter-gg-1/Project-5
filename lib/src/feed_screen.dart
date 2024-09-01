import 'package:blog_app/data_layer/blog_data.dart';
import 'package:blog_app/extension/size_config.dart';
import 'package:blog_app/model/blog_model.dart';
import 'package:blog_app/widget/card/blog_card.dart';
import 'package:blog_app/widget/slider/image_slider.dart';
import 'package:blog_app/widget/text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key});

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> slides = [
      {
        "image":
            "https://th.bing.com/th/id/OIP.4Y7DJ3yCxAJ9-W_gzkI6WAHaEE?w=283&h=180&c=7&r=0&o=5&pid=1.7",
        "subtitle": "Flutter 3",
        "description": "What is new in Flutter 3 ?!"
      },
      {
        "image":
            "https://th.bing.com/th/id/OIP.47gr1-6546gJhTDQ9bGZ9AHaE8?w=276&h=184&c=7&r=0&o=5&pid=1.7",

        "subtitle": "AI & Drone Future",
        "description": "What change ?"
      },
      {
        "image":
            "https://th.bing.com/th/id/OIP.ZI0r7piRykPs-z2vwM5a6QHaEK?w=282&h=180&c=7&r=0&o=5&pid=1.7",
        "subtitle": "GPU New RTX",
        "description": "Let your dreams come true"
      },
    ];
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          ImageSlider(slides: slides),
          const Divider(
            color: Color(0xff1f1f1f),
            thickness: 1,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(text: 'Top Stories'),
              Text(
                'See all',
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff636363)),
              )
            ],
          ),
          SingleChildScrollView(
            child: SizedBox(
              width: double.infinity,
              height: context.getHeight() * 0.45,
              child: TabBarView(children: [
                displayBlog(tabName: 'Technology'),
                displayBlog(tabName: 'AI'),
                displayBlog(tabName: 'Cloud'),
                displayBlog(tabName: 'Robotic'),
                displayBlog(tabName: 'IoT'),
              ]),
            ),
          ),
        ],
      ),
    ));
  }

  SingleChildScrollView displayBlog({required String tabName}) {
    return SingleChildScrollView(
      child: Column(
        children: GetIt.I
            .get<BlogData>()
            .blogs
            .map((e) => e.category == tabName
                ? BlogCard(
                    id: e.id,
                    writer: e.writer,
                    title: e.title,
                    timeToRead: e.time,
                    creationDate: e.creationDate,
                    isFaveiorte: e.isFaveiorte,
                    category: e.category,
                    summary: e.summary,
                    content: e.content,
                    removeOption: false,
                    onPressedBookMark: () {
                      e.isFaveiorte = !e.isFaveiorte;

                      setState(() {});
                      if (e.isFaveiorte) {
                        GetIt.I.get<BlogData>().markBlog(
                            blog: BlogModel(
                              category: e.category,
                              title: e.title,
                              writer: e.writer,
                              time: e.time,
                              summary: e.summary,
                              content: e.content,
                              creationDate: e.creationDate,
                              isFaveiorte: e.isFaveiorte,
                              id: e.id,
                            ),
                            writer: 'writer');
                      } else {
                        GetIt.I.get<BlogData>().reMarkBlog(id: e.id);
                      }
                    },
                  )
                : const Padding(padding: EdgeInsets.zero))
            .toList(),
      ),
    );
  }
}
