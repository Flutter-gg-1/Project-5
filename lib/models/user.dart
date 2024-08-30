import 'package:blog_app/models/blog.dart';

class User {
  final String username;
  final String password;
  final List<Blog> blogs;

  User({
    required this.username,
    required this.password,
    required this.blogs,
  });

  // Factory constructor to create a User object from a JSON map
  factory User.fromJson(Map<String, dynamic> json) {
    var blogsFromJson = json['blogs'] as List;
    List<Blog> blogList = blogsFromJson.map((blogJson) => Blog.fromJson(blogJson)).toList();

    return User(
      username: json['username'],
      password: json['password'],
      blogs: blogList,
    );
  }

  // Method to convert a User object to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'password': password,
      'blogs': blogs.map((blog) => blog.toJson()).toList(),
    };
  }
}

