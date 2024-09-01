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
