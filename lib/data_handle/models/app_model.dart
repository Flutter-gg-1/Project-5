

import 'package:get_storage/get_storage.dart';
import 'package:pro_5/data_handle/models/blog_data_model.dart';
import 'package:pro_5/data_handle/models/user_model.dart';

class AppModel {
  final box = GetStorage();
  

  UserModel? userLogin;
  UserModel gustLogin = UserModel(name: "gust", passowrd: "", isGust: true);

  List<UserModel> userList = [];

  List<BlogDataModel> blogList = [
    
  ];

  AppModel() {
    
    loadData();
  }

  loadData() {
    if (box.hasData('blogList')) {
      print(box.read("blogList"));
      for (var val in box.read("blogList")) {
        blogList.add(BlogDataModel.fromJson(val));
      }
    }

    if (box.hasData('userList')) {
       print(box.read("userList"));
      for (var val in box.read("userList")) {
        userList.add(UserModel.fromJson(val));
      }
    }

    if (box.hasData('gustLogin')) {
       print(box.read("gustLogin"));
      gustLogin = UserModel.fromJson(box.read("gustLogin"));
    }

    if (box.hasData('userLogin')) {
       print(box.read("userLogin"));
      userLogin = UserModel.fromJson(box.read("userLogin"));
    }
  }

  saveblogList() async {
    List<Map<String, dynamic>> tasksAsMap = [];
    for (var element in blogList) {
      tasksAsMap.add(element.toJson());
    }
    await box.write("blogList", tasksAsMap);
  }

  saveUserList() async {
    List<Map<String, dynamic>> tasksAsMap = [];
    for (var element in userList) {
      tasksAsMap.add(element.toJson());
    }
    await box.write("userList", tasksAsMap);
  }

  saveGust() async {
    await box.write("gustLogin", gustLogin.toJson());
  }

  saveUserLogin() async {
    if (userLogin != null) {
      await box.write("userLogin", userLogin!.toJson());
    } else {
      await box.write("userLogin", null);
    }
  }

  void userLog({required String name, required String passowrd}) {
    if (userList.isEmpty) {
      userList.add(UserModel(name: name, passowrd: passowrd, isGust: false));

      userLogin = userList.first;
    } else {
      for (var val in userList) {
        print(val.id);
        print(val.name);
        print(val.passowrd);
        print(val.isGust);

        if (val.name == name && val.passowrd == passowrd) {
          userLogin = val;
          saveUserLogin();

          saveUserList();
          return;
        }
      }

      var user = UserModel(name: name, passowrd: passowrd, isGust: false);

      userLogin = user;

      userList.add(user);
    }

    saveUserLogin();

    saveUserList();

    print(userList);
  }

  void addToList(BlogDataModel blogDataModel) {
    blogList.add(blogDataModel);

    saveblogList();
  }

  void addLiked() {}

 

  bool isBlogLike({required BlogDataModel blogDataModel}) {
    for (var val in blogDataModel.userLiked) {
      if (val == userLogin!.id) {
        return true;
      }
    }

    return false;
  }

  void updateBlogLike({required doLike, required BlogDataModel blog}) {
    if (doLike == true) {
      blog.userLiked.removeWhere((val) => val == userLogin!.id);
    } else {
      blog.userLiked.add(userLogin!.id);
    }

    saveblogList();
  }

  List<BlogDataModel> showLikedBlog() {
    List<BlogDataModel> userLiked = [];

    for (var blog in blogList) {
      for (var val in blog.userLiked) {
        if (val == userLogin!.id) {
          userLiked.add(blog);
        }
      }
    }

    return userLiked;
  }

  List<BlogDataModel> showUserBlog() {
    List<BlogDataModel> userblog = [];

    for (var blog in blogList) {
      if (blog.userId == userLogin!.id) {
        userblog.add(blog);
      }
    }

    return userblog;
  }

  void blogDel(
      {required BlogDataModel blog, required List<BlogDataModel> userList}) {
    for (int i = 0; i < blogList.length; i++) {
      if (blogList[i].id == blog.id) {
        blogList.removeAt(i);
      }
    }

    for (int i = 0; i < userList.length; i++) {
      if (userList[i].id == blog.id) {
        userList.removeAt(i);
      }
    }

    saveblogList();
  }

  List<BlogDataModel> blogListType({required type}) {
    List<BlogDataModel> temp = [];

    if (type == "t") {
      for (var val in blogList) {
        if (val.category == "Technology") {
          temp.add(val);
        }
      }

      return temp;
    }

    if (type == "a") {
      for (var val in blogList) {
        if (val.category == "AI") {
          temp.add(val);
        }
      }
      return temp;
    }

    if (type == "c") {
      for (var val in blogList) {
        if (val.category == "Cloud") {
          temp.add(val);
        }
      }
      return temp;
    }

    if (type == "r") {
      for (var val in blogList) {
        if (val.category == "Robotic") {
          temp.add(val);
        }
      }
      return temp;
    }

    if (type == "i") {
      for (var val in blogList) {
        if (val.category == "IoT") {
          temp.add(val);
        }
      }
      return temp;
    }
    return temp;
  }

  void gustUserMain() {
    userLogin = gustLogin;
     saveUserLogin();
  }

  void userLogout() {
    userLogin = null;

    saveUserLogin();
  }
}
