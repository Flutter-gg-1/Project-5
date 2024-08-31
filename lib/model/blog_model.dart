class BlogModel {
  late  String category;
  late final String authorName;
  late  String title;
  late  String summary;
  late  String content;
  late final String date;
  late  String minutesToRead;
  late final String imageSrc;
  late bool saved;

  BlogModel({
    required this.category,
    required this.authorName,
    required this.title,
    required this.summary,
    required this.content,
    required this.date,
    required this.minutesToRead,
    required this.imageSrc,
    required this.saved,
  });

  BlogModel.fromJson(Map<String, dynamic> json) {
    category = json['category'];
    authorName = json['authorName'];
    title = json['title'];
    summary = json['summary'];
    content = json['content'];
    date = json['date'];
    minutesToRead = json['minutesToRead'];
    imageSrc = json['imageSrc'];
    saved = json['saved'];
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
    data['saved'] = saved;

    return data;
  }
}
