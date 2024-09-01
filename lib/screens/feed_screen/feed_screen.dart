import 'package:blog_app/helper/extension/color_ext.dart';
import 'package:blog_app/helper/extension/nav.dart';
import 'package:blog_app/screens/add_news/add_news.dart';
import 'package:blog_app/services/user_services/user_services.dart';
import 'package:blog_app/widgets/tab_bar/custom_tab_bar.dart';
import 'package:blog_app/screens/feed_screen/tab_bar_view_containt.dart';
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
              Icon(
                Icons.search,
                color: ColorExt.white,
              ),
              if (userService.isLoggedIn && !userService.isGuest)
                IconButton(
                  onPressed: () async {
                    await context.push(
                      screen: const AddNews(),
                    );

                    (context as Element).rebuild();
                  },
                  icon: Icon(
                    Icons.add,
                    color: ColorExt.white,
                  ),
                ),
              const SizedBox(
                width: 40,
              )
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
          )),
    );
  }
}
