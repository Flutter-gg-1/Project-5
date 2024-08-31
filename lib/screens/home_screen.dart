import 'package:blog_app/data/app_data.dart';
import 'package:blog_app/screens/add_blog.dart';
import 'package:blog_app/widgets/home/blog_card.dart';
import 'package:blog_app/widgets/home/drone.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    bool isSaved = false;
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
            const Icon(
              Icons.search,
              color: Colors.white,
            ),
            const SizedBox(
              width: 10,
            ),
            GetIt.I.get<AppData>().loggedIn
                ? IconButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return AddBlog(
                          onSaved: (
                              {required content,
                              required summary,
                              required title,
                              required category}) {
                            GetIt.I.get<AppData>().createBlog(
                                category: category,
                                title: title,
                                summary: summary,
                                content: content,
                                image: "assets/home/google.png",
                                authorName:
                                    GetIt.I.get<AppData>().user.username);
                            setState(() {});
                          },
                        );
                      }));
                    },
                    icon: const Icon(
                      Icons.add,
                      color: Colors.white,
                    ))
                : const SizedBox(
                    width: 10,
                  ),
            const SizedBox(
              width: 10,
            ),
          ],
          bottom: const TabBar(
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorColor: Color(0xffDD403C),
            labelColor: Colors.white,
            tabs: [
              Tab(text: "Tech"),
              Tab(text: "AI"),
              Tab(text: "Cloud"),
              Tab(text: "Robotics"),
              Tab(text: "IoT"),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(
            top: 16.0,
            left: 16.0,
            right: 16.0,
          ),
          child: TabBarView(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    const Drone(),
                    Divider(
                      color: Colors.white.withOpacity(0.1),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Top Stories",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "See all",
                          style:
                              TextStyle(color: Color(0xff888888), fontSize: 12),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Column(
                      children: GetIt.I.get<AppData>().blogs.where(
                        (element) {
                          return element.category == "TECHNOLOGY";
                        },
                      ).map((blog) {
                        return BlogCard(
                          blog: blog,
                          onSaved: () {
                            isSaved
                                ? {
                                    GetIt.I
                                        .get<AppData>()
                                        .savedBlogs
                                        .remove(blog),
                                    isSaved = !isSaved
                                  }
                                : {
                                    GetIt.I.get<AppData>().savedBlogs.add(blog),
                                    isSaved = !isSaved
                                  };
                          },
                        );
                      }).toList(),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  children: [
                    const Drone(),
                    Divider(
                      color: Colors.white.withOpacity(0.1),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Top Stories",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "See all",
                          style:
                              TextStyle(color: Color(0xff888888), fontSize: 12),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Column(
                      children: GetIt.I.get<AppData>().blogs.where(
                        (element) {
                          return element.category == "Technology";
                        },
                      ).map((blog) {
                        return BlogCard(
                          blog: blog,
                          onSaved: () {
                            isSaved
                                ? {
                                    GetIt.I
                                        .get<AppData>()
                                        .savedBlogs
                                        .remove(blog),
                                    isSaved = !isSaved,
                                    setState(() {})
                                  }
                                : {
                                    GetIt.I.get<AppData>().savedBlogs.add(blog),
                                    isSaved = !isSaved,
                                    setState(() {})
                                  };
                          },
                        );
                      }).toList(),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                  ],
                ),
              ),
              const Column(
                children: [Text("data3")],
              ),
              const Column(
                children: [Text("data4")],
              ),
              const Column(
                children: [Text("data5")],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
