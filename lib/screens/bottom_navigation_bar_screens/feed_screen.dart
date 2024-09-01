import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:project5/data_layer/user_data.dart';
import 'package:project5/screens/bottom_navigation_bar_screens/explore_screen.dart';
import 'package:project5/widgets/custom_text/custom_text.dart';
import 'package:project5/widgets/custom_top_stories.dart';
import '../../data_layer/blog_data.dart';
import '../add_blog_post.dart';
import '../stories_detail.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key});

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  var isLogin = GetIt.I.get<UserData>().isLogedIn();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        backgroundColor: const Color(0xff111111),
        appBar: AppBar(
          leading: const Icon(
            Icons.menu,
            color: Color(0xffffffff),
            size: 28,
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context){
                  return const ExploreScreen();
                }));
              },
              icon: const Icon(
                Icons.search,
                color: Color(0xffffffff),
                size: 28,
              ),
            ),
            isLogin ?
            IconButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const AddBlogPost();
                })).then((value) => {
                          if (value != null) {setState(() {})}
                        });
              },
              icon: const Icon(               
                Icons.add,
                color: Color(0xffffffff),
                size: 28,
              ),
            ) : const SizedBox.shrink()
          ],
          backgroundColor: const Color(0xff1E1E1E),
          bottom: const TabBar(
            tabs: [
              Text("Tech"),
              Text("AI"),
              Text("Cloud"),
              Text("Robotics"),
              Text("IoT"),
            ],
            indicatorColor: Color(0xffDD403C),
            indicatorSize: TabBarIndicatorSize.tab,
            unselectedLabelStyle: TextStyle(color: Color(0xff888888)),
            labelStyle: TextStyle(color: Colors.white, fontSize: 16),
            labelPadding: EdgeInsets.all(4),
          ),
        ),
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 180,
                  width: 450,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      PageView(
                        children: [
                          Image.asset(
                            "assets/STK156_Instagram_threads_2 1.png",
                            fit: BoxFit.fill,
                          ),
                          Image.asset(
                            "assets/STK156_Instagram_threads_2 1.png",
                            fit: BoxFit.fill,
                          ),
                          Image.asset(
                            "assets/STK156_Instagram_threads_2 1.png",
                            fit: BoxFit.fill,
                          ),
                        ],
                      ),
                      const Positioned(
                          top: 130,
                          left: 20,
                          child: CustomText(
                            text: "DJI • Jul 10, 2023",
                            color: Color(0xffB8B8B8),
                            size: 10,
                            fontWeight: FontWeight.w500,
                          )),
                      const Positioned(
                          top: 150,
                          left: 20,
                          child: CustomText(
                              text: "A month with DJI Mini 3 Pro",
                              color: Colors.white,
                              size: 16,
                              fontWeight: FontWeight.bold)),
                      const Positioned(
                          top: 140,
                          left: 360,
                          child: Icon(
                            Icons.arrow_outward_outlined,
                            color: Colors.white,
                          )),
                    ],
                  ),
                ),
                Divider(
                  color: const Color(0xffFFFFFF).withOpacity(0.1),
                ),
                const SizedBox(
                  height: 12,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: "Top Stories",
                      color: Colors.white,
                      size: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    CustomText(
                      text: "See all",
                      color: Color(0xff888888),
                      size: 12,
                      fontWeight: FontWeight.w700,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                Column(
                    children: GetIt.I.get<BlogData>().blogData.map((e) {
                  Image image;
                  final file = File(e.postImage);
                  if (file.existsSync()) {
                    image = Image.file(file, fit: BoxFit.cover);
                  } else {
                    image = Image.asset("assets/google_small.png");
                  }
                  return CustomTopStories(
                    image: image,
                    title: e.authorName,
                    subtitle: e.title,
                    text: "${e.date.toLocal()} • ${e.minutesToRead} min Read",
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return StoriesDetail(id: e.id);
                      })).then((value) => {
                        if(value != null){
                          setState(() {
                          })
                        }
                      });
                    }, id: e.id, isSave: e.isSaved, onPressed: () {
                      GetIt.I.get<BlogData>().changeSaveState(id: e.id);
                      setState(() {
                      });
                    },
                  );
                }).toList()),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
