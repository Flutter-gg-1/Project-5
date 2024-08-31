import 'dart:convert';
import 'package:blog_nest/model/bookmark.dart';
import 'package:flutter/widgets.dart';
import 'package:get_storage/get_storage.dart';
import '../model/user.dart';

class UserMgr extends ChangeNotifier {
  List<User> allUsers = [];
  List<Bookmark> allBookmarks = [];
  final box = GetStorage();
  User? currentUser;

  UserMgr() {
    _fetchData();
  }

  void _fetchData() async {
    _fetchCurrentUser();
    _fetchUsers();
    _fetchBookmarks();
  }

  // C
  Future<void> _fetchCurrentUser() async {
    try {
      String? jsonString = box.read('currentUser');
      if (jsonString != null) {
        Map<String, dynamic> userMap = jsonDecode(jsonString);
        currentUser = User.fromJson(userMap);
      } else {
        currentUser = null;
      }
    } catch (e) {
      currentUser = null;
    }
  }

  Future<void> setCurrentUser({User? user, required bool isSignIn}) async {
    if (isSignIn) {
      currentUser = user;
      String jsonString = jsonEncode(user!.toJson());
      await box.write('currentUser', jsonString);
    } else {
      currentUser = null;
      await box.remove('currentUser');
    }
  }

  // All Users
  Future<void> _fetchUsers() async {
    List<Map<String, dynamic>> storageUsers = [];

    if (box.read('users') != null) {
      storageUsers = List.from(box.read('users')).cast<Map<String, dynamic>>();
      for (var user in storageUsers) {
        allUsers.add(User.fromJson(user));
      }
    } else {
      allUsers = await User.getDefaultUsers();
      List<Map<String, dynamic>> usersAsMap = [];
      for (var user in allUsers) {
        usersAsMap.add(user.toJson());
      }
      await box.write('users', usersAsMap);
    }
  }

  // Add User
  Future<void> addNewUser(User user) async {
    allUsers.add(user);
    List<Map<String, dynamic>> usersAsMap = [];
    for (var user in allUsers) {
      usersAsMap.add(user.toJson());
    }
    await box.write('users', usersAsMap);
  }

  // Bookmarks
  Future<void> _fetchBookmarks() async {
    List<Map<String, dynamic>> storageBookmarks = [];
    if (box.read('bookmarks') != null) {
      storageBookmarks =
          List.from(box.read('bookmarks')).cast<Map<String, dynamic>>();
      for (var bookmark in storageBookmarks) {
        allBookmarks.add(Bookmark.fromJson(bookmark));
      }
    }
  }

  // Toggle Bookmark
  Future<void> toggleBookmark({required int blogId}) async {
    var bookmark = allBookmarks
        .where((b) => (b.blogId == blogId && b.userId == currentUser?.id))
        .toList()
        .firstOrNull;

    bookmark != null
        ? allBookmarks.remove(bookmark)
        : allBookmarks
            .add(Bookmark(userId: currentUser?.id ?? -1, blogId: blogId));

    List<Map<String, dynamic>> bookmarksAsMap = [];

    for (var bookmark in allBookmarks) {
      bookmarksAsMap.add(bookmark.toJson());
    }
    await box.write('bookmarks', bookmarksAsMap);
  }
}
