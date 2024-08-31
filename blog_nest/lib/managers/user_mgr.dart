import 'dart:convert';
import 'package:blog_nest/model/bookmark.dart';
import 'package:blog_nest/model/favorite.dart';
import 'package:get_storage/get_storage.dart';
import '../model/blog.dart';
import '../model/user.dart';

class UserMgr {
  List<User> allUsers = [];
  List<Blog> allBlogs = [];
  List<Bookmark> allBookmarks = [];
  final box = GetStorage();
  User? currentUser;

  UserMgr() {
    _fetchData();
  }

  void _fetchData() {
    _fetchCurrentUser();
    _fetchUsers();
  }

  // Current User
  void _fetchCurrentUser() async {
    try {
      String jsonString = box.read('currentUser');
      currentUser = jsonDecode(jsonString);
    } catch (e) {
      currentUser = null;
    }
  }

  Future<void> setCurrentUser(
      {required User user, required bool isSignIn}) async {
    if (isSignIn) {
      currentUser = user;
      String jsonString = jsonEncode(user);
      await box.write('currentUser', jsonString);
    } else {
      currentUser = null;
      box.remove('currentUser');
    }
  }

  // All Users
  void _fetchUsers() async {
    try {
      String jsonString = box.read('users');
      if (jsonString.isNotEmpty) {
        List users = jsonDecode(jsonString);
        allUsers = users.map((user) => User.fromJson(user)).toList();
      } else {
        throw Exception('No users found');
      }
    } catch (e) {
      // Handle the case where users are not found
      var defaultUsers = await User.getDefaultUsers();
      for (var user in defaultUsers) {
        await addNewUser(user);
      }
    }
  }

  Future<void> addNewUser(User user) async {
    allUsers.add(user);
    String jsonString = jsonEncode(allUsers);
    await box.write('users', jsonString);
  }

  // Toggle Favorite
  Future<void> toggleBookmark({required int blogId}) async {
    var bookmark = allBookmarks
        .where((f) => (f.blogId == blogId && f.userId == f.userId))
        .toList()
        .firstOrNull;

    bookmark != null
        ? allBookmarks.remove(bookmark)
        : allBookmarks.add(Bookmark(userId: currentUser?.id, blogId: blogId));
    String jsonString = jsonEncode(allBookmarks);
    await box.write('bookmarks', jsonString);
  }
}
