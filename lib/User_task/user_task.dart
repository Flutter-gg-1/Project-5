import 'package:get_storage/get_storage.dart';
import 'package:project/User_Model/user_model.dart';

class UserTask {
  final box = GetStorage();
  List<UserModel> fakeUsers = [];

  UserTask() {
    _loadFakeUsers();
  }

  void _loadFakeUsers() {
    try {
      final storedUsers = box.read<List>('fakeUsers');
      if (storedUsers != null) {
        fakeUsers = storedUsers.map((userJson) {
          return UserModel.fromJson(Map<String, dynamic>.from(userJson as Map));
        }).toList();
       
        for (var user in fakeUsers) {
          print('User: ${user.username}, Posts: ${user.userPosts}');
        }
      } else {
        _initializeDefaultUsers();
      }
    } catch (e) {
      print("Error loading fakeUsers: $e");
      box.erase(); 
      _initializeDefaultUsers();
    }
  }

  void _initializeDefaultUsers() {
    fakeUsers = [
      UserModel(username: 'user1', flag: true, savedPosts: [], userPosts: []),
      UserModel(username: 'user2', flag: true, savedPosts: [], userPosts: []),
    ];
    saveFakeUsers();
  }

  void saveFakeUsers() {
    try {
      final usersJson = fakeUsers.map((user) => user.toJson()).toList();
      box.write('fakeUsers', usersJson);
    } catch (e) {
      print("Error saving fakeUsers: $e");
    }
  }

  UserModel loadUserData() {
    try {
      final jsonData = box.read<Map<String, dynamic>>('userdata');
      if (jsonData != null) {
        return UserModel.fromJson(jsonData);
      } else {
        return UserModel(
          username: '',
          flag: false,
          savedPosts: [],
          userPosts: [],
        );
      }
    } catch (e) {
      print("Error loading userdata: $e");
      return UserModel(
        username: '',
        flag: false,
        savedPosts: [],
        userPosts: [],
      );
    }
  }

  void saveUserData(UserModel userdata) {
    try {
      box.write('userdata', userdata.toJson());
    } catch (e) {
      print("Error saving userdata: $e");
    }
  }

  List<Map<String, dynamic>> loadAllPosts() {
    return fakeUsers.expand((user) {
      return user.userPosts.map((post) {
        return Map<String, dynamic>.from(post as Map);
      }).toList();
    }).toList();
  }

  void login(String username) {
    UserModel? foundUser = fakeUsers.firstWhere(
      (user) => user.username == username,
      orElse: () => UserModel(username: '', flag: false, savedPosts: [], userPosts: []),
    );

    if (foundUser.username.isNotEmpty) {
      foundUser.flag = true;
      saveUserData(foundUser);
    } else {
      UserModel userdata = loadUserData();
      userdata.flag = false;
      saveUserData(userdata);
    }
  }

  void addUserPost(String username, Map<String, dynamic> post) {
    final user = fakeUsers.firstWhere((user) => user.username == username);
    user.userPosts.add(post);
    saveFakeUsers();
  }

  void updateUserPost(String username, int index, Map<String, dynamic> updatedPost) {
    final user = fakeUsers.firstWhere((user) => user.username == username);
    user.userPosts[index] = updatedPost;
    saveFakeUsers();
  }

  void removeUserPost(String username, int index) {
    final user = fakeUsers.firstWhere((user) => user.username == username);
    user.userPosts.removeAt(index);
    saveFakeUsers();
  }
}
