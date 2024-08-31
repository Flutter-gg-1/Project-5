import 'package:project5/models/user.dart';

class AllUsers {
  User? currentUser;
  final List<User> users = [];

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
  }

  setCurrentUser({required String username, required String password}) {
    List<String> usernames = users.map((user)=>user.username).toList();
    if(usernames.contains(username)==false) {
      addUser(username: username, password: password);
      currentUser = users.last;
    }
    if(usernames.contains(username)) {
      for(var user in users){
        if(user.username == username && user.password == password) {
          currentUser = user;
          break;
        }
      }
    }
    return isLogged();
  }

  isLogged() {
    return currentUser == null ? false : true;
  }
}