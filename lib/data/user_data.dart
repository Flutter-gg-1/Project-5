import 'package:blog_app/data/blog_data.dart';
import 'package:blog_app/models/blog.dart';
import 'package:blog_app/models/user.dart';
import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';

class UserData {
  User user = User(
      username: "turki",
      password: "turki",
      title: "Software engineer",
      blogs: []);
  bool loggedIn = false;
  final box = GetStorage();

  List<Blog> savedBlogs = [];

  deleteBlog(Blog blog) {
    GetIt.I.get<UserData>().user.blogs.remove(blog);
    GetIt.I.get<BlogData>().blogs.remove(blog);
  }

  void loadUser() {
    if (box.hasData('loggedIn')) {
      loggedIn = box.read("loggedIn");
    }
    if (box.hasData("user")) {
      user = User.fromJson(box.read("user"));
    }
  }
}
