import 'post.dart';

class User {
  final String username;
  final String password;
  final List<Post> posts;
  bool isLoggedIn;
  User({required this.username, required this.password,required this.posts, this.isLoggedIn =false});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(username: json['username'], password: json['password'], posts: json['posts']);
  }

  toJson() {
    return {'username': username, 'password': password};
  }
}
