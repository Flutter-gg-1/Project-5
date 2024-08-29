class Blog {
  int id;
  String title;
  String timeStamp;
  String imgData;
  int authorId;

  Blog({
    required this.id,
    required this.title,
    required this.timeStamp,
    required this.imgData,
    required this.authorId,
  });

  factory Blog.fromJson(Map<String, dynamic> json) {
    return Blog(
      id: json['id'],
      title: json['title'],
      timeStamp: json['timeStamp'],
      imgData: json['imgData'],
      authorId: json['authorId'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'timeStamp': timeStamp,
        'imgData': imgData,
        'authorId': authorId,
      };
}
