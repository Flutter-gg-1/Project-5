class BlogModel {
  late final int id;
  late final String category;
  late  String title;
  late final String writer;
  late final String time;
  late  String summary;
  late  String content;
  late final String creationDate;
  late  bool isFaveiorte;

  BlogModel(
      {required this.category,
      required this.title,
      required this.writer,
      required this.time,
      required this.summary,
      required this.content,
      required this.creationDate,
      required this.isFaveiorte,
      required this.id,
      });

  BlogModel.fromJson(Map<String, dynamic> json) {
    category = json['category'];
    title = json['title'];
    writer = json['writer'];
    time = json['time'];
    summary = json['summary'];
    content = json['content'];
    creationDate = json['creationDate'];
    isFaveiorte = json['isFaveiorte'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['category'] = category;
    data['title'] = title;
    data['writer'] = writer;
    data['time'] = time;
    data['summary'] = summary;
    data['content'] = content;
    data['creationDate'] = creationDate;
    data['isFaveiorte'] = isFaveiorte;
    data['id'] = id;
    return data;
  }
}