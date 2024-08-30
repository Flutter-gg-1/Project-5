import 'package:blog_app/src/post_screen.dart';
import 'package:blog_app/widget/bars/bottom_nav_bar.dart';
import 'package:blog_app/widget/bars/custom_app_bar.dart';
import 'package:blog_app/widget/slider/image_slider.dart';
import 'package:blog_app/widget/text/custom_text.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
              )
            ],
          ),
        )),
      ),
    );
  }
}
