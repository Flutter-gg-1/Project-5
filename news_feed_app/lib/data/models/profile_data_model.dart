import 'package:get_storage/get_storage.dart';

class UserModel {
  String username;
  String password;
  List<int> favoritePostIds;
  bool loggedInbool;

  final box = GetStorage();

  UserModel({
    this.username = 'Kyle Barr',
    this.password = '123',
    List<int>? favoritePostIds,
    bool loggedIn = false,
  })  : favoritePostIds = favoritePostIds ?? [],
        loggedInbool = loggedIn {
    loadUserData(); // Load user data when the instance is created
  }

  bool get loggedIn => loggedInbool;

  void addFavorite(int postId) {
    if (!favoritePostIds.contains(postId)) {
      favoritePostIds.add(postId);
      saveUserData(); // Save after adding a favorite
    }
  }

  void removeFavorite(int postId) {
    favoritePostIds.remove(postId);
    saveUserData(); // Save after removing a favorite
  }

  bool isFavorite(int postId) {
    return favoritePostIds.contains(postId);
  }

  void logIn() {
    loggedInbool = true; 
    saveUserData(); // Save login state
  }

  void logOut() {
    loggedInbool = false; 
    saveUserData(); // Save login state
  }

  void saveUserData() async {
    await box.write('username', username);
    await box.write('password', password);
    await box.write('favoritePostIds', favoritePostIds);
    await box.write('loggedIn', loggedInbool);
  }

  void loadUserData() {
    if (box.hasData('username')) {
      username = box.read('username');
    }
    if (box.hasData('password')) {
      password = box.read('password');
    }
    if (box.hasData('favoritePostIds')) {
      favoritePostIds = List<int>.from(box.read('favoritePostIds'));
    }
    if (box.hasData('loggedIn')) {
      loggedInbool = box.read('loggedIn');
    }
  }
}