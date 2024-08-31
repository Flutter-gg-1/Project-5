class Post {
  final String title;
  final String summary;
  final String content;
  final String category;
  final int readingMinutes;
  final String author;
  final String dateCreated;
  final String? image;
  final bool isSaved;
  Post(
      {required this.title,
      required this.summary,
      required this.content,
      required this.category,
      required this.readingMinutes,
      required this.author,
      required this.dateCreated,
      this.image,
      this.isSaved = false});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
        title: json['title'],
        summary: json['summary'],
        content: json['content'],
        category: json['category'],
        readingMinutes: json['readingMinutes'],
        author: json['author'],
        dateCreated: json['date_created'],
        image: json['image']);
  }

  toJson() {
    return {
      'title': title,
      'summary': summary,
      'content': content,
      'category': category,
      'readingMinutes': readingMinutes,
      'author': author,
      'date_created': dateCreated,
      'image': image
    };
  }
}
