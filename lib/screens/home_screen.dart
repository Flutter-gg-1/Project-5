import 'package:blog_app_project/data/blog_data.dart';
import 'package:blog_app_project/helper/extensions/screen.dart';
import 'package:blog_app_project/screens/add_blog_screen.dart';
import 'package:blog_app_project/screens/blog_screen.dart';
import 'package:blog_app_project/widgets/custom_carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_it/get_it.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
          backgroundColor: const Color(0xff111111),
          appBar: AppBar(
            backgroundColor: const Color(0xff1E1E1E),
            leading: const Icon(
              Icons.menu_sharp,
              color: Color(0xffFFFFFF),
              size: 35,
            ),
            actions: [
              const Icon(
                Icons.search_rounded,
                color: Color(0xffFFFFFF),
                size: 30,
              ),
              const SizedBox(
                width: 10,
              ),
              IconButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext context) {
                    return const AddBlogScreen();
                  }));
                },
                icon: const FaIcon(
                  FontAwesomeIcons.plus,
                  color: Color(0xffffffff),
                ),
              ),
              const SizedBox(
                width: 4,
              ),
            ],
            bottom: const TabBar(
                //onTap:
                indicatorColor: Color(0xffDD403C),
                dividerColor: Colors.transparent,
                labelColor: Colors.white,
                indicatorSize: TabBarIndicatorSize.tab,
                unselectedLabelColor: Color(0xff888888),
                tabs: [
                  Text(
                    'Tech',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'AI',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'Cloud',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'Robot',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'IoT',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ]),
          ),
          body: TabBarView(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 14),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const CarouselSliderCustome(),
                      const SizedBox(height: 10),
                      Container(
                        height: 1,
                        width: context.getWidth() / 1.14,
                        color: const Color(0xffFFFFFF).withOpacity(0.10),
                      ),
                      const SizedBox(height: 14),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Top Stories',
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontFamily: 'Inter',
                                fontSize: 16,
                                color: Colors.white),
                          ),
                          SizedBox(
                            width: 170,
                          ),
                          Text(
                            'See all',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                                color: Color(0xff888888)),
                          )
                        ],
                      ),
                      const SizedBox(height: 14),
                      SingleChildScrollView(
                        child: Column(
                          children: GetIt.I
                              .get<BlogData>()
                              .blogList
                              .map((e) => BlogCardCustom(
                                    title: e.title,
                                    dateblog: e.date,
                                    nameOfBlog: e.authorName,
                                    time: e.minutesToRead.toString(),
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (BuildContext context) {
                                        return BlogScreen(
                                          category: e.category,
                                          content: e.content,
                                          dateblog: e.date,
                                          summary: e.summary,
                                          nameOfBlog: e.authorName,
                                          time: e.minutesToRead.toString(),
                                          title: e.title,
                                          imageSrc:
                                              'assets/STK156_Instagram_threads_2 2.png',
                                        );
                                      }));
                                    },
                                  ))
                              .toList(),
                        ),
                      ),

                      // SizedBox(
                      //   height: 300,
                      //   child: ListView.builder(
                      //     itemCount: GetIt.I.get<BlogData>().blogList.length,
                      //     itemBuilder: (context, index) {
                      //       final blog =
                      //           GetIt.I.get<BlogData>().blogList[index];
                      //       return BlogCardCustom(
                      //         nameOfBlog: blog.authorName,
                      //         title: blog.title,
                      //         dateblog: blog.date,
                      //         time: blog.minutesToRead.toString(),
                      //       );
                      //     },
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
              const Text('All2'),
              const Text('All3'),
              const Text('All4'),
              const Text('All5'),
            ],
          )),
    );
  }
}

class BlogCardCustom extends StatelessWidget {
  const BlogCardCustom(
      {super.key,
      required this.nameOfBlog,
      required this.title,
      required this.dateblog,
      this.imageSrc,
      required this.time,
      this.onTap});

  final String nameOfBlog;
  final String title;
  final String dateblog;
  final String time;
  final String? imageSrc;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Container(
            height: context.getHeight() / 6.5,
            width: 343,
            decoration: BoxDecoration(
              color: const Color(0xff1e1e1e),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                        margin: const EdgeInsets.only(left: 7),
                        height: 80,
                        width: 80,
                        child: Image.asset(
                            'assets/STK156_Instagram_threads_2 1.png')),
                    Container(
                      padding: const EdgeInsets.only(top: 6, left: 10),
                      constraints:
                          BoxConstraints(maxWidth: context.getWidth() / 1.6),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                nameOfBlog,
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Color(0xff919191),
                                ),
                              ),
                            ],
                          ),
                          Text(
                            title,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff919191),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 0, bottom: 0, left: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "$dateblog • $time min read",
                        style: const TextStyle(
                          fontSize: 14,
                          color: Color(0xff919191),
                        ),
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.bookmark_outline),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.more_vert),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 12),
      ],
    );
  }
}
