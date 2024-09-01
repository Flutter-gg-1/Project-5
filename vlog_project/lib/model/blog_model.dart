class Blog {
  String id;
  String category;
  String authorName;
  String title;
  String summary;
  String content;
  DateTime date;
  String imageUrl;
  int minutesToRead;

  Blog({
    required this.id,
    required this.category,
    required this.authorName,
    required this.title,
    required this.summary,
    required this.content,
    required this.date,
    required this.imageUrl,
    required this.minutesToRead,
  });

  // Add a copyWith method
  Blog copyWith({
    String? id,
    String? category,
    String? authorName,
    String? title,
    String? summary,
    String? content,
    DateTime? date,
    String? imageUrl,
    int? minutesToRead,
  }) {
    return Blog(
      id: id ?? this.id,
      category: category ?? this.category,
      authorName: authorName ?? this.authorName,
      title: title ?? this.title,
      summary: summary ?? this.summary,
      content: content ?? this.content,
      date: date ?? this.date,
      imageUrl: imageUrl ?? this.imageUrl,
      minutesToRead: minutesToRead ?? this.minutesToRead,
    );
  }

  factory Blog.fromJson(Map<String, dynamic> json) {
    return Blog(
      id: json['id'] ?? '',
      category: json['category'] ?? 'Uncategorized',
      authorName: json['authorName'] ?? 'Unknown',
      title: json['title'] ?? 'Untitled',
      summary: json['summary'] ?? '',
      content: json['content'] ?? '',
      date: DateTime.parse(json['date'] ?? DateTime.now().toString()),
      imageUrl: json['imageUrl'] ?? '',
      minutesToRead: json['minutesToRead'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'category': category,
      'authorName': authorName,
      'title': title,
      'summary': summary,
      'content': content,
      'date': date.toIso8601String(),
      'imageUrl': imageUrl,
      'minutesToRead': minutesToRead,
    };
  }
}
