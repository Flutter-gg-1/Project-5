class BlogModel {
  late final String category;
  late final String title;
  late final String writer;
  late final String time;
  late final String summary;
  late final String content;

  BlogModel(
      {required this.category,
      required this.title,
      required this.writer,
      required this.time,
      required this.summary,
      required this.content});

  BlogModel.fromJson(Map<String, dynamic> json) {
    category = json['category'];
    title = json['title'];
    writer = json['writer'];
    time = json['time'];
    summary = json['summary'];
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['category'] = category;
    data['title'] = title;
    data['writer'] = writer;
    data['time'] = time;
    data['summary'] = summary;
    data['content'] = content;
    return data;
  }
}