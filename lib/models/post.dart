class Post {
  final String category;
  final String authorName;
  String title;
  String summary;
  String content;
  final String date;
  final int minutesToRead;
  final String postImage;
  bool isSaved;

  Post({required this.category, required this.authorName, required this.title, required this.summary, required this.content, required this.date, required this.minutesToRead, this.postImage='assets/placeholder.png', required this.isSaved});
  
  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
        category: json['category'],
        authorName: json['authorName'],
        title: json['title'],
        summary: json['summary'],
        content: json['content'],
        date: json['date'],
        minutesToRead: json['minutesToRead'],
        postImage: json['postImage'],
        isSaved: json['isSaved']);
  }


  Map<String, dynamic> toJson() {
    return {
      'category': category,
      'authorName': authorName,
      'title': title,
      'summary': summary,
      'content': content,
      'date': date,
      'minutesToRead': minutesToRead,
      'postImage': postImage,
      'isSaved': isSaved
    };
  }
}