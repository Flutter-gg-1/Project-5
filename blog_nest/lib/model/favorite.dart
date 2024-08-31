import 'package:blog_nest/model/blog.dart';

class Favorite {
  int? userId;
  int blogId;

  Favorite({this.userId, required this.blogId});

  factory Favorite.fromJson(Map<String, dynamic> json) {
    return Favorite(
      userId: json['userId'],
      blogId: json['blogId'],
    );
  }

  Map<String, dynamic> toJson() => {'userId': userId, 'blogId': blogId};
}
