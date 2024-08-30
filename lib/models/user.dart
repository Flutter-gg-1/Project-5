import 'package:project5/models/post.dart';

class User {
  final String username;
  final String password;
  final List<Post> savedPosts;
  final List<Post> userPosts;

  User({required this.username, required this.password, required this.savedPosts, required this.userPosts});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      username: json['username'],
      password: json['password'],
      savedPosts: json['savedPosts'],
      userPosts: json['userPosts']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'username' : username,
      'password' : password,
      'savedPosts' : savedPosts,
      'userPosts' : userPosts
    };
  }
}