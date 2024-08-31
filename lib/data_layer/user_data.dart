import 'package:blog_app/models/blog_model.dart';
import 'package:blog_app/models/user_model.dart';
import 'package:get_storage/get_storage.dart';

class UserData {
  List<UserModel> users = [];
  List<BlogModel> savedBlogs = [];
  //storge
  final box = GetStorage();

  UserData() {
    loadUser();
    loadSavedBlogs();
  }

  addNewUser({required UserModel username}) {
    users.add(username);
    saveUser();
  }

  //save user
  saveUser() async {
    List<Map<String, dynamic>> userAsMap = [];
    for (var element in users) {
      userAsMap.add(element.toJson());
    }
    await box.write("user", userAsMap);
  }

  loadUser() {
    if (box.hasData('user')) {
      List<Map<String, dynamic>> usersSaved =
          List.from(box.read('user')).cast<Map<String, dynamic>>();
      for (var element in usersSaved) {
        users.add(UserModel.fromJson(element));
      }
    }
  }

  void saveBlog(BlogModel blog) async {
    savedBlogs.add(blog);
    List<Map<String, dynamic>> blogAsMap =
        savedBlogs.map((b) => b.toJson()).toList();
    await box.write("savedBlogs", blogAsMap);
  }

  void removeBlog(BlogModel blog) async {
    savedBlogs.remove(blog);
    List<Map<String, dynamic>> blogAsMap = savedBlogs.map((b) => b.toJson()).toList();
    await box.write("savedBlogs", blogAsMap);
  }
   bool isBlogSaved(BlogModel blog) {
    return savedBlogs.contains(blog);
  }


  void loadSavedBlogs() {
    if (box.hasData('savedBlogs')) {
      List<Map<String, dynamic>> blogsSaved =
          List.from(box.read('savedBlogs')).cast<Map<String, dynamic>>();
      for (var element in blogsSaved) {
        savedBlogs.add(BlogModel.fromJson(element));
      }
    }
  }
}
