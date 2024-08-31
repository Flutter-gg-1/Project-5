import 'package:blog_app/model/blog_model.dart';
import 'package:blog_app/model/user_model.dart';
import 'package:get_storage/get_storage.dart';

class GetBlog {
  List<BlogModel> blogs = [];
  UserModel currentUser = UserModel(password: "", userName: "");
  GetBlog() {
    loadblog();
    loadUser();
  }
  final box = GetStorage();

  void addblog(BlogModel blog) {
    blogs.add(blog);
    saveBlog();
  }

  void update({required BlogModel oldBlog, required BlogModel newBlog}) {
    for (var element in blogs) {
      if (oldBlog == element) {
        oldBlog.title = newBlog.title;
        oldBlog.content = newBlog.content;
        oldBlog.minutesToRead = newBlog.minutesToRead;
        oldBlog.summary = newBlog.summary;
      }
    }
    saveBlog();
  }

  void saveBlog() {
    List<Map<String, dynamic>> map = [];
    for (BlogModel blogs in blogs) {
      map.add(blogs.toJson());
    }
    box.write("blog", map);
  }

  void loadblog() {
    if (box.hasData('blog')) {
      List<Map<String, dynamic>> data =
          List.from(box.read('blog')).cast<Map<String, dynamic>>();
      for (var element in data) {
        blogs.add(BlogModel.fromJson(element));
      }
    }
  }

  void delete(BlogModel blog) {
    blogs.remove(blog);
    List<Map<String, dynamic>> map = [];
    for (BlogModel blog in blogs) {
      map.add(blog.toJson());
    }
    box.write("blog", map);
  }

  void deleteUser() {
    currentUser.userName = "";
    currentUser.password = "";
    if (box.hasData("user")) {
      box.remove("user");
    }
  }

  void saveUser(UserModel user) {
    box.write("user", user);
  }

  void loadUser() {
    if (box.hasData("user")) {
      currentUser = UserModel.fromJson(box.read("user"));
    }
  }

  void editBookMark(BlogModel blog) {
    for (BlogModel element in blogs) {
      if (blog == element) {
        element.saved = !element.saved;
      }
      saveBlog();
    }
  }
}
