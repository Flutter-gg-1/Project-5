class Post {
  // Image
  final String title;
  final String summary;
  final String content;
  final String category;
  final int readingMinutes;
  Post({
    required this.title,
    required this.summary,
    required this.content,
    required this.category,
    required this.readingMinutes,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
        title: json['title'],
        summary: json['summary'],
        content: json['content'],
        category: json['category'],
        readingMinutes: json['readingMinutes']);
  }

  toJson() {
    return {
      'title': title,
      'summary': summary,
      'content': content,
      'category': category,
      'readingMinutes': readingMinutes,
    };
  }
}
