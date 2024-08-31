class PostModel {
  late final String id;
  String? image;
  late final String title;
  late final String summary;
  late final String content;
  late final String category;
  late final String minutes;
  late final String date;
  late final String auther;
  late final String? userAvatar;

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
      this.userAvatar});

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
