class BlogModel {
  final String category;
  final String authorName;
  final String title;
  final String summary;
  final String content;
  final DateTime date;
  final int minutesToRead;

  BlogModel({
    required this.category,
    required this.authorName,
    required this.title,
    required this.summary,
    required this.content,
    required this.date,
    required this.minutesToRead,
  });

  factory BlogModel.fromJson(Map<String, dynamic> json) {
    return BlogModel(
      category: json['category'],
      authorName: json['authorName'],
      title: json['title'],
      summary: json['summary'],
      content: json['content'],
      date: DateTime.parse(json['date']),
      minutesToRead: json['minutesToRead'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'category': category,
      'authorName': authorName,
      'title': title,
      'summary': summary,
      'content': content,
      'date': date.toIso8601String(),
      'minutesToRead': minutesToRead,
    };
  }
}
