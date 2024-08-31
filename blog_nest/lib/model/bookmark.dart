import 'package:blog_nest/model/blog.dart';

class Bookmark {
  int userId;
  int blogId;

  Bookmark({required this.userId, required this.blogId});

  factory Bookmark.fromJson(Map<String, dynamic> json) {
    return Bookmark(
      userId: json['userId'],
      blogId: json['blogId'],
    );
  }

  Map<String, dynamic> toJson() => {'userId': userId, 'blogId': blogId};
}
