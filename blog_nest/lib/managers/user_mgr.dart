import 'dart:convert';
import 'package:get_storage/get_storage.dart';
import '../model/blog.dart';
import '../model/user.dart';

class UserMgr {
  List<User> allUsers = [];
  List<Blog> allBlogs = [];
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

  Future<void> setCurrentUser(User user, bool isSignIn) async {
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
      for (var user in User.defaultUsers) {
        await addNewUser(user);
      }
    }
  }

  Future<void> addNewUser(User user) async {
    allUsers.add(user);
    String jsonString = jsonEncode(allUsers);
    await box.write('users', jsonString);
  }
}
