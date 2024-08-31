import 'post.dart';

class User {
  final String username;
  final String password;
  final String position;
  List<Post> posts;
  List<Post> saved;
  bool isLoggedIn;
  User(
      {required this.username,
      required this.password,
      required this.position,
      this.posts = const [],
      this.saved = const [],
      this.isLoggedIn = false});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        username: json['username'],
        password: json['password'],
        position: json['position'],
       posts: (json['posts'] as List<dynamic>)
        .map((post) => Post.fromJson(post as Map<String, dynamic>))
        .toList(),
    saved: (json['saved'] as List<dynamic>)
        .map((post) => Post.fromJson(post as Map<String, dynamic>))
        .toList(),
        )
        ;
  }

  toJson() {
    return {
      'username': username,
      'password': password,
      'position': position,
      'posts': posts,
      'saved' : saved
    };
  }
}
