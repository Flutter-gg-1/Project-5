import 'package:get_storage/get_storage.dart';
import 'package:project_5/src/models/user_model.dart';

/// 1- check username if exist
/// 2- check password is correct
/// 3- save user auth in box storage
/// 4- get user data from storage
class UserData {
  List<UserModel> allUser = [
    UserModel(username: "abdualjaleel", password: "123456", loginStatus: true),
    UserModel(username: "mohammed", password: "123456", loginStatus: true),
  ];
  final box = GetStorage();

  UserData() {
    loaduser();
    // checkUserLoginStatus();
  }

  addNewUser({required UserModel newUser}) {
    allUser.add(newUser);
    saveUser();
  }

  bool checkUserData({required String username, required String password}) {
    for (var user in allUser) {
      if (user.username == username && user.password == password) {
        return true;
      }
    }
    return false;
  }

//convert object user to list of map then n save user in box storage
  saveUser() async {
    List<Map<String, dynamic>> userAsMap = [];
    for (var element in allUser) {
      userAsMap.add(element.toJson());
    }
    await box.write('user', userAsMap);
  }

  loaduser() {
    // box.erase();
    if (box.hasData('user')) {
      List<Map<String, dynamic>> savedUser =
          List.from(box.read("user")).cast<Map<String, dynamic>>();
      for (var element in savedUser) {
        allUser.add(UserModel.fromJson(element));
      }
    }
  }

  checkUserLoginStatus() {
    for (var user in allUser) {
      if (user.loginStatus!) {
        // Navigator.of(context).push(MaterialPageRoute(
        //                         builder: (context) => HomeScreen()));
        // Get.to(HomeScreen());
        print('${user.username} is logged in.');
      } else {
        // Get.to(LoginScreen());
        print('${user.username} is not logged in.');
      }
    }
  }

  bool isLoggedIn() {
    return box.read('loggedInUser') != null;
  }

  void login(String username) {
    box.write('loggedInUser', username);
  }

  whoIsLogin() {
    return box.read('loggedInUser');
  }

  void logout() {
    box.remove('loggedInUser');
  }

  void saveProfileImage(String username, String imagePath) {
    box.write('username_profileImage', imagePath);
  }

  String? getProfileImage(String username) {
    return box.read('username_profileImage');
  }
}
