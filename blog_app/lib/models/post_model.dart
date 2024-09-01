class PostModel {
  late final String id;
  late String? image;
  late String title;
  late String summary;
  late String content;
  late String category;
  late String minutes;
  late final String date;
  late final String auther;
  late String? userAvatar;
  bool? saved;

  PostModel(
      {this.image = "assets/img_holder.png",
      required this.id,
      required this.title,
      required this.summary,
      required this.content,
      required this.category,
      required this.minutes,
      required this.date,
      required this.auther,
      this.userAvatar,
      this.saved = false});

  PostModel.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    title = json['Title'];
    summary = json['summary'];
    content = json['content'];
    category = json['category'];
    minutes = json['minutes'];
    date = json['date'];
    auther = json['auther'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['image'] = image;
    data['Title'] = title;
    data['summary'] = summary;
    data['content'] = content;
    data['category'] = category;
    data['minutes'] = minutes;
    data['date'] = date;
    data['auther'] = auther;
    return data;
  }
}
