class BlogDataModel {
  BlogDataModel({
    required this.category,
    required this.authorName,
    required this.title,
    required this.summary,
    required this.content,
    required this.date,
    required this.minutesToRead,
    required this.postImage,
    required this.id,
    required this.isSaved
  });
   String category;
  final String authorName;
   String title;
   String summary;
   String content;
   DateTime date;
   int minutesToRead;
   String postImage;
  final int id;
  bool isSaved;

 factory BlogDataModel.fromJson(Map<String, dynamic> json) {
  return BlogDataModel(
   category: json['category'],
    authorName: json['authorName'],
    title : json['title'],
    summary : json['summary'],
    content : json['content'],
    date : DateTime.parse(json['date']),
    minutesToRead : json['minutesToRead'],
    postImage : json['postImage'],
    id : json['id'],
    isSaved : json['isSaved'],
  );
  }

  Map<String, dynamic> toJson() {
    return {
    'category' : category,
    'authorName' : authorName,
    'title' : title,
    'summary' : summary,
    'content' : content,
    'date' : date.toString(),
    'minutesToRead' : minutesToRead,
    'postImage' : postImage,
    'id' : id,
    'isSaved' : isSaved,
    };
  }
}
