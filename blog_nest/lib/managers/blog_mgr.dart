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

  Future<void> _fetchBlogs() async {
    List<Map<String, dynamic>> storageBlogs = [];

    if (box.read('blogs') != null) {
      storageBlogs = List.from(box.read('blogs')).cast<Map<String, dynamic>>();
      for (var blog in storageBlogs) {
        allBlogs.add(Blog.fromJson(blog));
      }
    } else {
      allBlogs = await Blog.getDefaultBlogs();
      List<Map<String, dynamic>> blogsAsMap = [];
      for (var blog in allBlogs) {
        blogsAsMap.add(blog.toJson());
      }
      await box.write('blogs', blogsAsMap);
    }
  }

  Future<void> addNewBlog(Blog blog) async {
    allBlogs.add(blog);
    List<Map<String, dynamic>> blogsAsMap = [];
    for (var blog in allBlogs) {
      blogsAsMap.add(blog.toJson());
    }
    await box.write('blogs', blogsAsMap);
  }

  Future<void> removeBlog({required int blogId}) async {
    Blog? blog =
        allBlogs.where((blog) => blog.id == blogId).toList().firstOrNull;
    if (blog != null) {
      allBlogs.remove(blog);
      List<Map<String, dynamic>> blogsAsMap = [];
      for (var blog in allBlogs) {
        blogsAsMap.add(blog.toJson());
      }
      await box.write('blogs', blogsAsMap);
    } else {
      // ERROR!
    }
  }
}
