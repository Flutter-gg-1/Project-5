import 'package:blog_app/model/blog_model.dart';
import 'package:get_storage/get_storage.dart';

class BlogData {
  List<BlogModel> blogs = [];
  List<BlogModel> markedBlogs = [];
  final box = GetStorage();

  editBlog(
      {required int id,
      required String title,
      required String summary,
      required String content}) {
    for (var element in blogs) {
      if (element.id == id) {
        element.title = title;
        element.content = content;
        element.summary = summary;
      }
    }
  }
  reMarkBlog(
      {required int id,
}) {
    for (var element in blogs) {
      if (element.id == id) {
       markedBlogs.removeWhere((element) => markedBlogs.contains(element));
      }
    }
  }
markBlog({required BlogModel blog,required String writer}){
markedBlogs.add(blog);
}
}
