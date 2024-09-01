import 'package:blogs_app/models/blog.dart';
import 'package:get_storage/get_storage.dart';
import 'dart:math';

class BlogService {
  final GetStorage storage = GetStorage();

  String generateUniqueId() {
    int timestamp = DateTime.now().millisecondsSinceEpoch;
    int randomNum = Random().nextInt(100000);
    return '$timestamp-$randomNum';
  }

  List<Blog> getBlogs() {
    try {
      List<Map<String, dynamic>> blogs =
          storage.read<List<dynamic>>('blogs')?.cast<Map<String, dynamic>>() ??
              [];
      print('Blogs retrieved: ${blogs.length}');
      return blogs.map((blogMap) => Blog.fromMap(blogMap)).toList();
    } catch (e) {
      print('Error retrieving blogs: $e');
      return [];
    }
  }

  void addBlog(Blog blog) {
    try {
      List<Map<String, dynamic>> blogs =
          storage.read<List<dynamic>>('blogs')?.cast<Map<String, dynamic>>() ??
              [];
      blog.id = generateUniqueId();
      blogs.add(blog.toMap());
      storage.write('blogs', blogs);
      print('Blog added successfully. Total blogs: ${blogs.length}');
    } catch (e) {
      print('Error adding blog: $e');
    }
  }

  void updateBlog(Blog updatedBlog) {
    try {
      List<Map<String, dynamic>> blogs =
          storage.read<List<dynamic>>('blogs')?.cast<Map<String, dynamic>>() ??
              [];
      int index =
          blogs.indexWhere((blogMap) => blogMap['id'] == updatedBlog.id);

      if (index != -1) {
        blogs[index] = updatedBlog.toMap();
        storage.write('blogs', blogs);
        print('Blog updated successfully.');
      }
    } catch (e) {
      print('Error updating blog: $e');
    }
  }

  void deleteBlog(String id) {
    try {
      List<Map<String, dynamic>> blogs =
          storage.read<List<dynamic>>('blogs')?.cast<Map<String, dynamic>>() ??
              [];
      blogs.removeWhere((blogMap) => blogMap['id'] == id);
      storage.write('blogs', blogs);
      print('Blog deleted successfully. Total blogs: ${blogs.length}');
    } catch (e) {
      print('Error deleting blog: $e');
    }
  }

  bool blogExists(String id) {
    try {
      List<Map<String, dynamic>> blogs =
          storage.read<List<dynamic>>('blogs')?.cast<Map<String, dynamic>>() ??
              [];
      return blogs.any((blogMap) => blogMap['id'] == id);
    } catch (e) {
      print('Error checking if blog exists: $e');
      return false;
    }
  }

  List<Blog> getSavedBlogs() {
    try {
      List<Map<String, dynamic>> savedBlogs = storage
              .read<List<dynamic>>('saved_blogs')
              ?.cast<Map<String, dynamic>>() ??
          [];
      return savedBlogs.map((blogMap) => Blog.fromMap(blogMap)).toList();
    } catch (e) {
      print('Error retrieving saved blogs: $e');
      return [];
    }
  }

  void saveBlog(Blog blog) {
    try {
      List<Map<String, dynamic>> savedBlogs = storage
              .read<List<dynamic>>('saved_blogs')
              ?.cast<Map<String, dynamic>>() ??
          [];
      if (!savedBlogs.any((blogMap) => blogMap['id'] == blog.id)) {
        savedBlogs.add(blog.toMap());
        storage.write('saved_blogs', savedBlogs);
      }
    } catch (e) {
      print('Error saving blog: $e');
    }
  }

  void removeSavedBlog(String id) {
    try {
      List<Map<String, dynamic>> savedBlogs = storage
              .read<List<dynamic>>('savedBlogs')
              ?.cast<Map<String, dynamic>>() ??
          [];
      savedBlogs.removeWhere((blogMap) => blogMap['id'] == id);
      storage.write('savedBlogs', savedBlogs);
      print(
          'Blog removed from saved blogs. Total saved blogs: ${savedBlogs.length}');
    } catch (e) {
      print('Error removing blog from saved blogs: $e');
    }
  }
}
