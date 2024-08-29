import 'package:blog_nest/model/enum/blog_category.dart';

class Blog {
  int id;
  String title;
  BlogCategory category;
  String timeStamp;
  String imgData;
  int authorId;

  Blog({
    required this.id,
    required this.title,
    required this.category,
    required this.timeStamp,
    required this.imgData,
    required this.authorId,
  });

  factory Blog.fromJson(Map<String, dynamic> json) {
    return Blog(
      id: json['id'],
      title: json['title'],
      category: json['category'],
      timeStamp: json['timeStamp'],
      imgData: json['imgData'],
      authorId: json['authorId'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'category': category,
        'timeStamp': timeStamp,
        'imgData': imgData,
        'authorId': authorId,
      };

  static var defaultBlogs = [
    Blog(
        id: 1,
        title: '',
        category: BlogCategory.iot,
        timeStamp: '',
        imgData: '',
        authorId: 1),
    Blog(
        id: 2,
        title: '',
        category: BlogCategory.iot,
        timeStamp: '',
        imgData: '',
        authorId: 1),
    Blog(
        id: 3,
        title: '',
        category: BlogCategory.robotics,
        timeStamp: '',
        imgData: '',
        authorId: 2),
  ];
}
