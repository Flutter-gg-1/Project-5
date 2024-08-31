import 'package:blog_app/models/blog.dart';

class User {
  final String username;
  final String password;
  final String title;
  final List<Blog> blogs;

  User({
    required this.username,
    required this.password,
    required this.title,
    required this.blogs,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    var blogsFromJson = json['blogs'] as List;
    List<Blog> blogList =
        blogsFromJson.map((blogJson) => Blog.fromJson(blogJson)).toList();

    return User(
      username: json['username'],
      password: json['password'],
      title: json['title'],
      blogs: blogList,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'password': password,
      'title': title,
      'blogs': blogs.map((blog) => blog.toJson()).toList(),
    };
  }
}
