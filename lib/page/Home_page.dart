import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:pro_5/data_handle/git_it/setup.dart';
import 'package:pro_5/data_handle/models/app_model.dart';
import 'package:pro_5/data_handle/models/blog_data_model.dart';
import 'package:pro_5/data_handle/models/user_model.dart';
import 'package:pro_5/page/add_blog_page.dart';

import 'package:pro_5/widget/home_page/feed_tab_body_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<BlogDataModel> blogList = getIt.get<AppModel>().blogList;

  List<BlogDataModel> blogListTech = [];
  List<BlogDataModel> blogListAi = [];
  List<BlogDataModel> blogListCloud = [];
  List<BlogDataModel> blogListRob = [];
  List<BlogDataModel> blogListIot = [];

  UserModel user =  getIt.get<AppModel>().userLogin!;

  @override
  void initState() {
    blogListTech = getIt.get<AppModel>().blogListType(type: "t");
    blogListAi = getIt.get<AppModel>().blogListType(type: "a");
    blogListCloud = getIt.get<AppModel>().blogListType(type: "c");
    blogListRob = getIt.get<AppModel>().blogListType(type: "r");
    blogListIot = getIt.get<AppModel>().blogListType(type: "i");

    super.initState();
  }

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
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.search, color: Colors.white),
              ),
             user.isGust == false ?  IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) {
                      return const AddBlogPage();
                    },
                  )).then((onValue) {
                    if (onValue == true) {
                      blogListTech =
                          getIt.get<AppModel>().blogListType(type: "t");
                      blogListAi =
                          getIt.get<AppModel>().blogListType(type: "a");
                      blogListCloud =
                          getIt.get<AppModel>().blogListType(type: "c");
                      blogListRob =
                          getIt.get<AppModel>().blogListType(type: "r");
                      blogListIot =
                          getIt.get<AppModel>().blogListType(type: "i");
                      setState(() {});
                    }
                  });
                },
                icon: const Icon(
                  FontAwesome.plus_solid,
                  color: Colors.white,
                ),
              ) : Text("")
            ],
            bottom: TabBar(
              tabAlignment: TabAlignment.center,
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorColor: const Color(0xffDD403C),
              unselectedLabelColor: const Color(0xff888888),
              labelColor: Colors.white,
              dividerColor: const Color(0xffFFFFFF).withOpacity(0.1),
              onTap: (value) {
                blogListTech = getIt.get<AppModel>().blogListType(type: "t");
                blogListAi = getIt.get<AppModel>().blogListType(type: "a");
                blogListCloud = getIt.get<AppModel>().blogListType(type: "c");
                blogListRob = getIt.get<AppModel>().blogListType(type: "r");
                blogListIot = getIt.get<AppModel>().blogListType(type: "i");

                setState(() {});
              },
              tabs: [
                Tab(
                  child: Text(
                    "Tech",
                    style: GoogleFonts.inter(),
                  ),
                ),
                Tab(
                  child: Text(
                    "AI",
                    style: GoogleFonts.inter(),
                  ),
                ),
                Tab(
                  child: Text(
                    "Cloud",
                    style: GoogleFonts.inter(),
                  ),
                ),
                Tab(
                  child: Text(
                    "Robotics",
                    style: GoogleFonts.inter(),
                  ),
                ),
                Tab(
                  child: Text(
                    "IoT",
                    style: GoogleFonts.inter(),
                  ),
                )
              ],
            ),
          ),
          body: TabBarView(
            children: [
              FeedTabBodyWidget(blogList: blogListTech),
              FeedTabBodyWidget(blogList: blogListAi),
              FeedTabBodyWidget(blogList: blogListCloud),
              FeedTabBodyWidget(blogList: blogListRob),
              FeedTabBodyWidget(blogList: blogListIot),
            ],
          )),
    );
  }
}
