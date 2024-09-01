class BlogDataModel {
  String summary;
  String content;
  String title;
  String category;
  String img;
  String date;
  String readingMin;
  String userName;

  int userId;
  List<int> userLiked = [];

  static int classId = 1;

  late final int id;

  BlogDataModel(
      {required this.summary,
      required this.content,
      required this.title,
      required this.category,
      required this.img,
      required this.readingMin,
      required this.date,
      required this.userName,
      required this.userId}) {
    id = classId;

    classId += 1;
  }

  factory BlogDataModel.fromJson(Map<String, dynamic> json) {
    return BlogDataModel(
        summary: json["summary"],
        content: json["content"],
        title: json["title"],
        category: json["category"],
        img: json["img"],
        readingMin: json["readingMin"],
        date: json["date"],
        userName: json["userName"],
        userId: json["userId"]);
  }



  Map<String,dynamic> toJson(){


    return{
      "summary" : summary,
      "content" : content,
      "title" : title,
      "category" : category,
      "img" : img,
      "readingMin" : readingMin,
      "date" : date,
      "userName" : userName,
      "userId" : userId,



    };
  }
}
