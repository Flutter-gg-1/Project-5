import 'package:blog_nest/screens/login/login_screen.dart';
import 'package:flutter/material.dart';
import '../screens/add_blog/add_blog_screen.dart';
import '../screens/blog_details/blog_details_screen.dart';
import '../screens/bottom_nav_bar/bottom_nav_bar_view.dart';

class NavMgr {
  Future<void> navigate(
      {required BuildContext context, required Destination dest}) {
    return Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => getDestination(dest)))
        .then((value) {});
  }

  void signOut(
      {required BuildContext context, Destination dest = Destination.login}) {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => getDestination(dest)),
        (Route<dynamic> route) => false);
  }

  void navigateBack({required BuildContext context, String? str}) =>
      Navigator.pop(context, str);

  Widget getDestination(Destination dest) {
    switch (dest) {
      case Destination.login:
        return PopScope(canPop: false, child: LoginScreen());
      case Destination.home:
        return const PopScope(canPop: false, child: BottomNavBarView());
      case Destination.addBlog:
        return const PopScope(canPop: true, child: AddBlogScreen());
      case Destination.blogDetails:
        return PopScope(canPop: true, child: BlogDetailsScreen());
      default:
        try {
          throw Error();
        } catch (_) {}
        return LoginScreen();
    }
  }
}

// MARK: - Update getDestination() when a new view is added

enum Destination { login, home, addBlog, blogDetails }
