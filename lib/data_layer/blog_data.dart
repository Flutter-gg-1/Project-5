import 'package:project_5/models/blog_model.dart';

class BlogData {
  List<BlogModel> blogs = [];

  addNewBlog({required BlogModel newBlog}) {
    blogs.add(newBlog);
  }
}
