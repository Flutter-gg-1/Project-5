class BlogModel {
   String category;
  final String authorName;
   String title;
   String summary;
   String content;
   String date;
   String minutesToRead;
   bool? isFavorite;
  final int id;

  BlogModel({
    required this.id,
    required this.category,
    required this.authorName,
    required this.title,
    required this.summary,
    required this.content,
    required this.date,
    required this.minutesToRead,
    required this.isFavorite,
  });

  factory BlogModel.fromJson(Map<String, dynamic> json) {
    return BlogModel(
      id: json["id"],
      isFavorite: json["isFavorite"],
      category: json['category'],
      authorName: json['authorName'],
      title: json['title'],
      summary: json['summary'],
      content: json['content'],
      date: json['date'],
      minutesToRead: json['minutesToRead'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'isFavorite': isFavorite,
      'category': category,
      'authorName': authorName,
      'title': title,
      'summary': summary,
      'content': content,
      'date': date,
      'minutesToRead': minutesToRead,
    };
  }
}
