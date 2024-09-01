import 'package:blog_app/model/blog_model.dart';
import 'package:blog_app/model/user_model.dart';
import 'package:get_storage/get_storage.dart';

class BlogData {
  List<BlogModel> blogs = [];
  List<UserModel> users = [];
  List<BlogModel> markedBlogs = [];
  final box = GetStorage();

  BlogData() {
    loadBlog();
  }
  addNewBlog({required BlogModel blog}) {
    blogs.add(blog);
    saveBlogs();
  }

  editBlog(
      {required int id,
      required String title,
      required String summary,
      required String content}) {
    for (var element in blogs) {
      if (element.id == id) {
        element.title = title;
        element.content = content;
        element.summary = summary;
      }
    }
    saveBlogs();
  }

  reMarkBlog({
    required int id,
  }) {
    for (var element in blogs) {
      if (element.id == id) {
        markedBlogs.removeWhere((element) => markedBlogs.contains(element));
      }
    }
  }

  markBlog({required BlogModel blog, required String writer}) {
    markedBlogs.add(blog);
  }

  Future<void> saveBlogs() async {
    List<Map<String, dynamic>> blogsAsMap = [];
    for (var element in blogs) {
      blogsAsMap.add(element.toJson());
    }
    await box.write('blog', blogsAsMap);
  }

  Future<void> loadBlog() async {
    if (box.hasData('blog')) {
      List<Map<String, dynamic>> savedBlogs = List.from(await box.read('blog'));
      for (var element in savedBlogs) {
        blogs.add(BlogModel.fromJson(element));
      }
    }
  }

  removeBlog({required int id}) {
    List<BlogModel> toRemove = [];
    for (var element in blogs) {
      if (element.id == id) {
        toRemove.add(element);
      }
    }
    blogs.removeWhere(
      (element) => toRemove.contains(element),
    );
    saveBlogs();
  }
}
