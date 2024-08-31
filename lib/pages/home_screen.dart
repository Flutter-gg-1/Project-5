import 'package:flutter/material.dart';
import 'package:project_5/components/pageview/pageview_custom.dart';
import 'package:project_5/components/stories/stories.dart';
import 'package:project_5/components/text/text_custom.dart';
import 'package:project_5/data_layer/blog_data.dart';
import 'package:project_5/data_layer/login_data.dart';
import 'package:project_5/pages/add_blog_screen.dart';
import 'package:project_5/pages/blog_page.dart';
import 'package:project_5/services/setup.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentPage = 0;
  bool isChanged = false;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        backgroundColor: const Color(0xff111111),
        appBar: AppBar(
          bottom: const TabBar(
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorColor: Color(0xffDD403C),
            labelColor: Colors.white,
            unselectedLabelColor: Color(0xff888888),
            tabs: [
              Tab(
                text: "Tech",
              ),
              Tab(
                text: "AI",
              ),
              Tab(
                text: "Cloud",
              ),
              Tab(
                text: "Robotics",
              ),
              Tab(
                text: "IoT",
              ),
            ],
          ),
          leading: const Icon(
            Icons.list_sharp,
            color: Colors.white,
          ),
          backgroundColor: const Color(0xff1e1e1e),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                color: Colors.white,
              ),
            ),
            getIt.get<LoginData>().checkLogin()
                ? IconButton(
                    onPressed: () {
                      Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const AddBlogScreen()))
                          .then((onValue) {
                        if (onValue != null) {
                          setState(() {});
                        }
                      });
                    },
                    icon: const Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  )
                : const Text("")
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                SizedBox(
                  width: 343,
                  height: 180,
                  child: Stack(children: [
                    PageView(
                        onPageChanged: (int page) {
                          setState(() {
                            _currentPage = page;
                          });
                        },
                        children: const [
                          PageviewCustom(),
                          PageviewCustom(),
                          PageviewCustom(),
                        ]),
                    Positioned(
                        top: 10,
                        left: 145,
                        child: Container(
                            height: 12,
                            width: 32,
                            decoration: BoxDecoration(
                                color: const Color(0x5558534b),
                                borderRadius: BorderRadius.circular(25)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Center(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        height: 4,
                                        width: 4,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Color(_currentPage == 0
                                                ? 0xffFFFFFF
                                                : 0xff8a8781)),
                                      ),
                                      Container(
                                        height: 4,
                                        width: 4,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Color(_currentPage == 1
                                                ? 0xffFFFFFF
                                                : 0xff8a8781)),
                                      ),
                                      Container(
                                        height: 4,
                                        width: 4,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Color(_currentPage == 2
                                                ? 0xffFFFFFF
                                                : 0xff8a8781)),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ))),
                  ]),
                ),
                const Divider(
                  color: Color(0x20FFFFFF),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextCustom(
                        text: "Top Stories",
                        color: Color(0xffE8E8E8),
                        weight: FontWeight.w700,
                        fontSize: 16),
                    TextCustom(
                        text: "See all",
                        color: Color(0xff888888),
                        weight: FontWeight.w600,
                        fontSize: 12)
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                Column(
                    children: getIt
                        .get<BlogData>()
                        .blogs
                        .map((e) => Stories(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => BlogPage(
                                              selectedId: e.id,
                                            ))).then((onValue) {
                                  if (onValue != null) {
                                    setState(() {});
                                  }
                                });
                              },
                              imagePath:
                                  "assets/STK156_Instagram_threads_2 2.png",
                              title: e.title,
                              subtitle: e.content,
                              date: e.date,
                              readTime: e.minutesToRead,
                              onPressed: () {
                                getIt.get<BlogData>().toggleFavorite(id: e.id);
                                setState(() {});
                              },
                              icon: e.isFavorite!
                                  ? Icons.bookmark
                                  : Icons.bookmark_border,
                            ))
                        .toList())
              ],
            ),
          ),
        ),
      ),
    );
  }
}
