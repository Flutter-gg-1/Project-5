import 'package:blog_app/models/blog_model.dart';

class UserModel {
  UserModel({
    required this.userName,
    required this.id,
    List<BlogModel>? savedBlogs,
    List<BlogModel>? userNews,
  })  : savedBlogs = savedBlogs ?? [],
        userNews = userNews ?? [];

  late final String userName;
  late final int id;
  List<BlogModel> savedBlogs;
  List<BlogModel> userNews;

  UserModel.fromJson(Map<String, dynamic> json)
      : userName = json['userName'] ?? '',
        id = json['id'] ?? 0,
        savedBlogs = (json['savedBlogs'] as List<dynamic>?)
                ?.map((b) => BlogModel.fromJson(b as Map<String, dynamic>))
                .toList() ??
            [],
        userNews = (json['userNews'] as List<dynamic>?)
                ?.map((b) => BlogModel.fromJson(b as Map<String, dynamic>))
                .toList() ??
            [];

  Map<String, dynamic> toJson() {
    return {
      'userName': userName,
      'id': id,
      'savedBlogs': savedBlogs.map((b) => b.toJson()).toList(),
      'userNews': userNews.map((b) => b.toJson()).toList(),
    };
  }
}
