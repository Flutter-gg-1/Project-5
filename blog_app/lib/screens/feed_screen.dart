import 'package:blog_app/data/post_data.dart';

import 'package:blog_app/screens/add_screen.dart';
import 'package:blog_app/screens/news_screen.dart';
import 'package:blog_app/services/setup.dart';
import 'package:blog_app/widgets/cards/post_widget.dart';
import 'package:blog_app/widgets/cards/home_ad_widget.dart';
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
            const Icon(Icons.search, color: Colors.white),
            box.read("token") != null
                ? IconButton(
                    onPressed: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AddScreen()),
                      );
                      setState(() {});
                    },
                    icon: const Icon(Icons.add, color: Colors.white, size: 25))
                : const Text(""),
            const SizedBox(width: 5)
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
          child: SingleChildScrollView(
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
                Column(
                  children: GetIt.I
                      .get<PostData>()
                      .allPostes
                      .map((e) => PostWidget(
                          onSave: () {
                            GetIt.I.get<PostData>().addToSaved(id: e.id);

                            setState(() {});
                          },
                          isSevd: e.saved,
                          image: e.image,
                          title: e.title,
                          subTitle: e.auther,
                          date: e.date,
                          min: e.minutes,
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => NewsScreen(
                                        title: e.title,
                                        category: e.category,
                                        content: e.content,
                                        summary: e.summary,
                                        date: e.date,
                                        image: e.image,
                                        min: e.minutes,
                                        userAvatar: e.userAvatar,
                                      )))))
                      .toList(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
