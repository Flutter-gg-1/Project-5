import 'package:blog_app/models/blog_model.dart';
import 'package:blog_app/models/user_model.dart';
import 'package:get_storage/get_storage.dart';

class UserData {
  List<UserModel> users = [];
  UserModel? currentUser;
  final box = GetStorage();

  UserData() {
    loadUser();
  }

  void setCurrentUser(UserModel user) {
    currentUser = user;
    loadSavedBlogs();
    loadUserNews();
  }

  void addNewUser({required UserModel user}) {
    users.add(user);
    saveUser();
  }

  Future<void> saveUser() async {
    List<Map<String, dynamic>> userAsMap =
        users.map((e) => e.toJson()).toList();
    await box.write("user", userAsMap);
  }

  void loadUser() {
    if (box.hasData('user')) {
      List<Map<String, dynamic>> usersSaved =
          List.from(box.read('user')).cast<Map<String, dynamic>>();
      for (var element in usersSaved) {
        users.add(UserModel.fromJson(element));
      }
    }
  }

  Future<void> logout() async {
    currentUser = null;
  }

  Future<void> saveBlog(BlogModel blog) async {
    if (currentUser == null) {
      return;
    }

    final List<BlogModel> mutableSavedBlogs =
        List.from(currentUser!.savedBlogs);

    mutableSavedBlogs.add(blog);

    List<Map<String, dynamic>> blogAsMap =
        mutableSavedBlogs.map((b) => b.toJson()).toList();
    await box.write("${currentUser!.userName}_savedBlogs", blogAsMap);

    currentUser!.savedBlogs = mutableSavedBlogs;
    await saveUser();
  }

  Future<void> removeBlog(BlogModel blog) async {
    if (currentUser == null) {
      return;
    }

    final List<BlogModel> mutableSavedBlogs =
        List.from(currentUser!.savedBlogs);

    mutableSavedBlogs.remove(blog);

    List<Map<String, dynamic>> blogAsMap =
        mutableSavedBlogs.map((b) => b.toJson()).toList();
    await box.write("${currentUser!.userName}_savedBlogs", blogAsMap);

    currentUser!.savedBlogs = mutableSavedBlogs;
    await saveUser();
  }

  bool isBlogSaved(BlogModel blog) {
    return currentUser?.savedBlogs.contains(blog) ?? false;
  }

  Future<void> saveBlogToUserNews(BlogModel blog) async {
    if (currentUser == null) {
      return;
    }

    final List<BlogModel> mutableUserNews = List.from(currentUser!.userNews);

    mutableUserNews.add(blog);

    List<Map<String, dynamic>> blogAsMap =
        mutableUserNews.map((b) => b.toJson()).toList();
    await box.write("${currentUser!.userName}_userNews", blogAsMap);

    currentUser!.userNews = mutableUserNews;
    await saveUser();
  }

  Future<void> removeBlogFromUserNews(BlogModel blog) async {
    if (currentUser == null) {
      return;
    }

    final List<BlogModel> mutableUserNews = List.from(currentUser!.userNews);

    mutableUserNews.remove(blog);

    List<Map<String, dynamic>> blogAsMap =
        mutableUserNews.map((b) => b.toJson()).toList();
    await box.write("${currentUser!.userName}_userNews", blogAsMap);

    currentUser!.userNews = mutableUserNews;
    await saveUser();
  }

  void loadSavedBlogs() {
    if (currentUser != null &&
        box.hasData("${currentUser!.userName}_savedBlogs")) {
      List<Map<String, dynamic>> blogsSaved =
          List.from(box.read("${currentUser!.userName}_savedBlogs"))
              .cast<Map<String, dynamic>>();
      currentUser!.savedBlogs =
          blogsSaved.map((e) => BlogModel.fromJson(e)).toList();
    }
  }

  void loadUserNews() {
    if (currentUser != null &&
        box.hasData("${currentUser!.userName}_userNews")) {
      List<Map<String, dynamic>> newsSaved =
          List.from(box.read("${currentUser!.userName}_userNews"))
              .cast<Map<String, dynamic>>();
      currentUser!.userNews =
          newsSaved.map((e) => BlogModel.fromJson(e)).toList();
    }
  }
}
