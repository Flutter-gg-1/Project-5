import 'package:blog_app/src/post_screen.dart';
import 'package:blog_app/widget/bars/bottom_nav_bar.dart';
import 'package:blog_app/widget/bars/custom_app_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
      ),
    );
  }
}
