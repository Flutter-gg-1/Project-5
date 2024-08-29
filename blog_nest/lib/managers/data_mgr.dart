import 'dart:convert';

import 'package:get_storage/get_storage.dart';

import '../model/blog.dart';
import '../model/user.dart';

class DataMgr {
  List<User> allUsers = [];
  List<Blog> allBlogs = [];
  final box = GetStorage();

  DataMgr() {
    _fetchData();
  }

  void _fetchData() {
    _fetchUsers();
    _fetchBlogs();
  }

  // MARK: - User

  void _fetchUsers() async {
    String? jsonString = box.read('users');
    if (jsonString == null) {
      // Run on first launch only
      User.defaultUsers.map((user) async => await addNewUser(user));
    }
    List users = jsonDecode(jsonString!);
    allUsers = users.map((user) => User.fromJson(user)).toList();
  }

  Future<void> addNewUser(User user) async {
    allUsers.add(user);
    String jsonString = jsonEncode(allUsers);
    await box.write('users', jsonString);
  }

  // MARK: - Blog

  void _fetchBlogs() {}
}
