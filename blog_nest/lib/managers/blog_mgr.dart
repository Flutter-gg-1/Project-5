import 'dart:convert';
import 'package:blog_nest/managers/user_mgr.dart';
import 'package:blog_nest/model/enum/blog_category.dart';
import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';
import '../model/blog.dart';

class BlogMgr {
  List<Blog> allBlogs = [];
  List<Blog> get userBlogs {
    int? userId = GetIt.I.get<UserMgr>().currentUser?.id;
    return userId == null
        ? []
        : allBlogs.where((blog) => (blog.authorId == userId)).toList();
  }

  List<Blog> get categoryBlogs {
    return allBlogs
        .where((blog) => (blog.category == selectedCategory))
        .toList();
  }

  BlogCategory selectedCategory = BlogCategory.iot;
  Blog? selectedBlog;

  final box = GetStorage();

  BlogMgr() {
    _fetchBlogs();
  }

  void _fetchBlogs() {
    try {
      String? jsonString = box.read('blogs');
      List blogs = jsonDecode(jsonString!);
      allBlogs = blogs.map((blog) => Blog.fromJson(blog)).toList();
    } catch (e) {
      Blog.defaultBlogs.map((blog) async => await addNewBlog(blog));
    }
  }

  Future<void> addNewBlog(Blog blog) async {
    allBlogs.add(blog);
    String jsonString = jsonEncode(allBlogs);
    await box.write('blogs', jsonString);
  }
}
