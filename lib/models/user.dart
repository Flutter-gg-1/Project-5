import 'post.dart';

class User {
  final String username;
  final String password;
  final String position;
  final List<Post> posts;
  bool isLoggedIn;
  User(
      {required this.username,
      required this.password,
      required this.position,
      required this.posts,
      this.isLoggedIn = false});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        username: json['username'],
        password: json['password'],
        position: json['position'],
        posts: json['posts']);
  }

  toJson() {
    return {
      'username': username,
      'password': password,
      'position': position,
      'posts': posts
    };
  }
}
