class Blog {
  String id; 
  String category;
  String authorName;
  String title;
  String summary;
  String content;
  String date;
  String minutesToRead;
  String postImage;
  bool isSaved;

  Blog({
    required this.id,
    required this.category,
    required this.authorName,
    required this.title,
    required this.summary,
    required this.content,
    required this.date,
    required this.minutesToRead,
    required this.postImage,
    this.isSaved = false, 
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'category': category,
      'authorName': authorName,
      'title': title,
      'summary': summary,
      'content': content,
      'date': date,
      'minutesToRead': minutesToRead,
      'postImage': postImage,
      'isSaved': isSaved,
    };
  }

  factory Blog.fromMap(Map<String, dynamic> map) {
    return Blog(
      id: map['id'],
      category: map['category'],
      authorName: map['authorName'],
      title: map['title'],
      summary: map['summary'],
      content: map['content'],
      date: map['date'],
      minutesToRead: map['minutesToRead'],
      postImage: map['postImage'],
      isSaved: map['isSaved'] ?? false,
    );
  }
}
