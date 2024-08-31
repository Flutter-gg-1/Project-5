import 'package:blog_app/data_layer/blog_data.dart';
import 'package:blog_app/extension/size_config.dart';
import 'package:blog_app/src/post_screen.dart';
import 'package:blog_app/widget/bars/bottom_nav_bar.dart';
import 'package:blog_app/widget/bars/custom_app_bar.dart';
import 'package:blog_app/widget/card/blog_card.dart';
import 'package:blog_app/widget/slider/image_slider.dart';
import 'package:blog_app/widget/text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> slides = [
      {
        "image":
            "https://devloop01.github.io/voyage-slider/images/scotland-mountains.jpg",
        "title": "Highlands",
        "subtitle": "Scotland",
        "description": "The mountains are calling"
      },
      {
        "image":
            "https://devloop01.github.io/voyage-slider/images/machu-pichu.jpg",
        "title": "Machu Pichu",
        "subtitle": "Peru",
        "description": "Adventure is never far away"
      },
      {
        "image":
            "https://devloop01.github.io/voyage-slider/images/chamonix.jpg",
        "title": "Chamonix",
        "subtitle": "France",
        "description": "Let your dreams come true"
      },
    ];

    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: customAppBar(
          onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const PostScreen(),
              )),
        ),
        bottomNavigationBar: const CustomBottomBar(),
        body: SafeArea(
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
                  height: context.getHeight()*0.45,
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
        )),
      ),
    );
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
                    onPressedBookMark: () {
                      e.isFaveiorte = !e.isFaveiorte;
      
                      setState(() {});
                      if (e.isFaveiorte) {
                        //later save on fav screen
                      }
                    },
                  )
                : Padding(
                  padding:  EdgeInsets.all(context.getWidth()*0.20),
                  child: const CustomText(text: 'No Blog Here right now :('),
                ))
            .toList(),
      ),
    );
  }
}
