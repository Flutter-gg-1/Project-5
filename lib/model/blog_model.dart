class BlogModel {
  BlogModel({
    required this.id,
    required this.category,
    required this.authorName,
    required this.title,
    required this.summary,
    required this.content,
    required this.date,
    required this.minutesToRead,
    this.postImage,
    this.isSaved,
  });
  late final int id;
  late final String category;
  late final String authorName;
  late String title;
  late String summary;
  late String content;
  late final String date;
  late final int minutesToRead;
  late final String? postImage;
  late final bool? isSaved;

  BlogModel.fromJson(Map<String, dynamic> json) {
    category = json['category'];
    authorName = json['authorName'];
    title = json['title'];
    summary = json['summary'];
    content = json['content'];
    date = json['date'];
    minutesToRead = json['minutesToRead'];
    postImage = json['postImage'];
    isSaved = json['isSaved'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['category'] = category;
    data['authorName'] = authorName;
    data['title'] = title;
    data['summary'] = summary;
    data['content'] = content;
    data['date'] = date;
    data['minutesToRead'] = minutesToRead;
    data['postImage'] = postImage;
    data['isSaved'] = isSaved;
    return data;
  }
}
