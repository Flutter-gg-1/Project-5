class ArticleModel {
  late int id;
  late String category;
  late String authorName;
  late String summary;
  late String content;
  late String? publishedAt;
  late double minutesToRead;
  late String postImage;

  ArticleModel({
    required this.id,
    required this.category,
    required this.authorName,
    required this.summary,
    required this.content,
    required this.minutesToRead,
    required this.postImage,
  }) : publishedAt = DateTime.now().toString();

  ArticleModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    category = json['category'];
    authorName = json['authorName'];
    summary = json['summary'];
    content = json['content'];
    publishedAt = json['publishedAt'];
    minutesToRead = json['minutesToRead'];
    postImage = json['postImage'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'category': category,
      'authorName': authorName,
      'summary': summary,
      'content': content,
      'publishedAt': publishedAt,
      'minutesToRead': minutesToRead,
      'postImage': postImage,
    };
  }
}
