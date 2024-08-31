import 'package:blog_app/helper/extension/color_ext.dart';
import 'package:blog_app/screens/add_news.dart';
import 'package:blog_app/services/user_services/user_services.dart';
import 'package:blog_app/widgets/tab_bar/custom_tab_bar.dart';
import 'package:blog_app/widgets/tab_bar/tab_bar_view_containt.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userService = GetIt.I.get<UserService>();
    return DefaultTabController(
      length: 5,
      child: Scaffold(
          backgroundColor: ColorExt.background,
          appBar: AppBar(
            backgroundColor: ColorExt.leaden,
            leading: Icon(
              Icons.menu,
              color: ColorExt.white,
            ),
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.search,
                    color: ColorExt.white,
                  )),
              if (userService.isLoggedIn && !userService.isGuest)
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AddNews(),
                    ),
                  );
                },
                icon: Icon(
                  Icons.add,
                  color: ColorExt.white,
                ),
              ),
            ],
            bottom: const PreferredSize(
                preferredSize: Size.fromHeight(40.0), child: CustomTabBar()),
          ),
          body: const TabBarView(
            children: [
              TabBarViewContaint(),
              TabBarViewContaint(),
              TabBarViewContaint(),
              TabBarViewContaint(),
              TabBarViewContaint(),
            ],
          )
          ),
    );
  }
}
