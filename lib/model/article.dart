class ArticleModel {
  late int id;
  late String title;
  late String imagePath;
  late String publishedAt;
  late String content;

  ArticleModel({
    required this.id,
    required this.title,
    required this.imagePath,
    required this.content,
  }) : publishedAt = DateTime.now().toString();

  ArticleModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    imagePath = json['imagePath'];
    publishedAt = json['publishedAt'];
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['imagePath'] = imagePath;
    data['publishedAt'] = publishedAt;
    data['content'] = content;
    return data;
  }
}
