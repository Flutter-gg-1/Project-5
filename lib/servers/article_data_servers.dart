import 'package:get_storage/get_storage.dart';
import 'package:project_5/model/article.dart';

class ArticleDataServers {
  List<ArticleModel> articleData = [
    ArticleModel(
      id: 1,
      category: 'Flutter',
      authorName: 'Abu Mukhlef',
      summary: 'Flutter is an open-source UI toolkit',
      content: 'Flutter is an open-source UI toolkit',
      minutesToRead: 2,
      postImage: 'assets/1.png',
    ),
  ];
  final box = GetStorage();
}
