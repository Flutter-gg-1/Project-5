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

  



  static int classId = 0;

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
      required this.userId
      }){

        id = classId;

        classId +=1;


      }
}
