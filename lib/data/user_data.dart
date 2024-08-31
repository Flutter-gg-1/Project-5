import 'package:blog_app/models/blog.dart';
import 'package:blog_app/models/user.dart';

class UserData {
  User user = User(
      username: "turki",
      password: "turki",
      title: "Software engineer",
      blogs: []);
  bool loggedIn = false;

  List<Blog> savedBlogs = [];
}
