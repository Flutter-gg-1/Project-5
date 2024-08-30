import 'package:blog_app/screens/news_screen.dart';
import 'package:blog_app/services/setup.dart';
import 'package:blog_app/widgets/blog_widget.dart';
import 'package:blog_app/widgets/home_widget.dart';
import 'package:flutter/material.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        backgroundColor: const Color(0xff111111),
        appBar: AppBar(
          backgroundColor: const Color(0xff1E1E1E),
          leading: const Icon(
            Icons.menu,
            color: Colors.white,
          ),
          actions: [
            Icon(Icons.search, color: Colors.white),
            box.read("token") != null ? Icon(Icons.add) : Text("")
          ],
          bottom: const TabBar(
              labelColor: Colors.white,
              unselectedLabelColor: Color(0xff888888),
              indicatorColor: Color(0xffDD403C),
              indicatorSize: TabBarIndicatorSize.tab,
              dividerColor: Color.fromARGB(255, 59, 59, 59),
              tabs: [
                Tab(text: "Tech"),
                Tab(text: "AI"),
                Tab(text: "Cloud"),
                Tab(text: "Robotics"),
                Tab(text: "IoT"),
              ]),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 15),
          child: Column(
            children: [
              const HomeWidget(),
              const SizedBox(height: 10),
              const Divider(color: Color.fromARGB(255, 59, 59, 59)),
              const SizedBox(height: 10),
              const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Top Stories",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold)),
                    Text(
                      "See all",
                      style: TextStyle(
                          color: Color(0xff888888),
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                    )
                  ]),
              const SizedBox(height: 10),
              BlogWidget(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const NewsScreen())))
            ],
          ),
        ),
      ),
    );
  }
}
