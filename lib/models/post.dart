class Post {
  // Image
  final String title;
  final String summary;
  final String content;
  final String category;
  final int readingMinutes;
  final String author;
  Post({
    required this.title,
    required this.summary,
    required this.content,
    required this.category,
    required this.readingMinutes,
    required this.author
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
        title: json['title'],
        summary: json['summary'],
        content: json['content'],
        category: json['category'],
        readingMinutes: json['readingMinutes'],author: json['author']);
        
  }

  toJson() {
    return {
      'title': title,
      'summary': summary,
      'content': content,
      'category': category,
      'readingMinutes': readingMinutes,
      'author' : author
    };
  }
}
