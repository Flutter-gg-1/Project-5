// import 'package:get_storage/get_storage.dart';
// import 'package:vlog_project/model/blog_model.dart';


// class BlogService {
//   final GetStorage _storage = GetStorage();  // Initialize GetStorage instance
//   final String _key = 'blogs';  // Key for storing blogs in GetStorage

//   // Retrieve all blogs from local storage
//   List<Blog> getBlogs() {
//     final blogsData = _storage.read<List<dynamic>>(_key) ?? [];
//     return blogsData.map((blog) => Blog.fromJson(blog)).toList();
//   }

//   // Add a new blog to local storage
//   void addBlog(Blog blog) {
//     final blogs = getBlogs();  // Retrieve existing blogs
//     blogs.add(blog);  // Add the new blog
//     _storage.write(_key, blogs.map((b) => b.toJson()).toList());  // Save updated list
//   }

//   // Update an existing blog in local storage
//   void updateBlog(Blog blog) {
//     final blogs = getBlogs();  // Retrieve existing blogs
//     final index = blogs.indexWhere((b) => b.id == blog.id);  // Find the blog by ID
//     if (index != -1) {
//       blogs[index] = blog;  // Update the blog
//       _storage.write(_key, blogs.map((b) => b.toJson()).toList());  // Save updated list
//     }
//   }

//   // Delete a blog from local storage
//   void deleteBlog(String id) {
//     final blogs = getBlogs();  // Retrieve existing blogs
//     blogs.removeWhere((b) => b.id == id);  // Remove the blog by ID
//     _storage.write(_key, blogs.map((b) => b.toJson()).toList());  // Save updated list
//   }
// }


import 'package:get_storage/get_storage.dart';
import 'package:uuid/uuid.dart';
import 'package:vlog_project/model/blog_model.dart';

class BlogService {
  final GetStorage _storage = GetStorage();
  static const String _blogsKey = 'blogs';
  final Uuid _uuid = Uuid();

  List<Blog> getBlogs() {
    final List<dynamic> storedBlogs = _storage.read(_blogsKey) ?? [];
    return storedBlogs.map((json) => Blog.fromJson(json)).toList();
  }

  void addBlog(Blog blog) {
    final List<Blog> blogs = getBlogs();
    blog.id = _uuid.v4(); // Generate a unique ID for the new blog
    blogs.add(blog);
    _saveBlogs(blogs);
  }

  void updateBlog(Blog updatedBlog) {
    final List<Blog> blogs = getBlogs();
    final index = blogs.indexWhere((blog) => blog.id == updatedBlog.id);
    if (index != -1) {
      blogs[index] = updatedBlog;
      _saveBlogs(blogs);
    }
  }

  void deleteBlog(String id) {
    final List<Blog> blogs = getBlogs();
    blogs.removeWhere((blog) => blog.id == id);
    _saveBlogs(blogs);
  }

  void _saveBlogs(List<Blog> blogs) {
    final List<Map<String, dynamic>> jsonList = blogs.map((blog) => blog.toJson()).toList();
    _storage.write(_blogsKey, jsonList);
  }
}
