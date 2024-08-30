class BlogModel {
  late final String category;
  late final String authorName;
  late final String title;
  late final String summary;
  late final String content;
  late final String date;
  late final String minutesToRead;
  late final String imageSrc;
    BlogModel({
    required this.category,
    required this.authorName,
    required this.title,
    required this.summary,
    required this.content,
    required this.date,
    required this.minutesToRead,
    required this.imageSrc,
  });

   
  BlogModel.fromJson(Map<String, dynamic> json){
    category = json['category'];
    authorName = json['authorName'];
    title = json['title'];
    summary = json['summary'];
    content = json['content'];
    date = json['date'];
    minutesToRead = json['minutesToRead'];
    imageSrc = json['imageSrc'];
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
    data['imageSrc'] = imageSrc;
    return data;
  }
}

