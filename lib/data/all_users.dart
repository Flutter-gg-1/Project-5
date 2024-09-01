import 'package:get_storage/get_storage.dart';
import 'package:project5/models/post.dart';
import 'package:project5/models/user.dart';

class AllUsers {
  User? currentUser;
  final List<User> users = [];

  AllUsers() {
    loadUsers();
    // usersBox.erase();
  }

  final usersBox = GetStorage();

  loadUsers() {
    var currentUserAsJson = usersBox.read('currentUser');
    if(currentUserAsJson!=null) {
      currentUserAsJson['savedPosts'] = currentUserAsJson['savedPosts'].map<Post>((savedPost) => Post.fromJson(savedPost as Map<String, dynamic>)).toList();
      currentUserAsJson['userPosts'] = currentUserAsJson['userPosts'].map<Post>((savedPost) => Post.fromJson(savedPost as Map<String, dynamic>)).toList();
      currentUser = User.fromJson(currentUserAsJson);
    }

    if(usersBox.hasData('users')) {
      // get users as an iterable of dynamics
      List<dynamic> tempBox = usersBox.read('users');

      // convert to list of maps
      List<Map<String,dynamic>> tempList = List.from(tempBox).cast<Map<String,dynamic>>();
      
      // update users, ensure casting lists to lists of post
      for (var jsonUser in tempList) {
        jsonUser['savedPosts'] = jsonUser['savedPosts'].map<Post>((savedPost) => Post.fromJson(savedPost as Map<String, dynamic>)).toList();
        jsonUser['userPosts'] = jsonUser['userPosts'].map<Post>((savedPost) => Post.fromJson(savedPost as Map<String, dynamic>)).toList();
        users.add(User.fromJson(jsonUser));
      }
    }
  }

  // if user is not already added, addUser will be called
  addUser({required String username, required String password}) {
    users.add(
      User(
        username: username,
        password: password,
        savedPosts: [],
        userPosts: []
      )
    );
    usersBox.write('users',users);
  }

  bool setCurrentUser({required String username, required String password}) {
    List<String> usernames = users.map((user)=>user.username).toList();
    if(usernames.contains(username)==false) {
      addUser(username: username, password: password);
      currentUser = users.last;
      usersBox.write('currentUser', currentUser);
      return true;
    }
    if(usernames.contains(username)) {
      for(var user in users){
        if(user.username == username && user.password == password) {
          currentUser = user;
          usersBox.write('currentUser', currentUser);
          return true;
        }
      }
    }
    return false;
  }

  addToUserSavedPosts({required Post post}) {
    if(currentUser!=null) {
      currentUser!.savedPosts.add(post);
      usersBox.write('users',users);
    }
  }

  removeFromUserSavedPosts({required Post post}) {
    if(currentUser!=null) {
      currentUser!.savedPosts.remove(post);
      usersBox.write('users',users);
    }
  }

  refreshSaved() {
    usersBox.write('currentUser', currentUser);
  }
}