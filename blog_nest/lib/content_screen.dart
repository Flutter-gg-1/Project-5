import 'package:blog_nest/screens/bottom_nav_bar/bottom_nav_bar_view.dart';
import 'package:blog_nest/screens/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'managers/user_mgr.dart';

class ContentScreen extends StatelessWidget {
  ContentScreen({super.key});

  final currentUser = GetIt.I.get<UserMgr>().currentUser;

  @override
  Widget build(BuildContext context) {
    if (currentUser == null) {
      return LoginScreen();
    } else {
      return const BottomNavBarView();
    }
  }
}
