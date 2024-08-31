import 'package:get_storage/get_storage.dart';
import 'package:project_5/models/blog_model.dart';

class BlogData {
  List<BlogModel> blogs = [];
  final box = GetStorage();

  BlogData() {
    loadBlogs();
  }

  addNewBlog({required BlogModel newBlog}) {
    blogs.add(newBlog);
    box.write("blogs", blogs);
  }

  deleteBlog({required int id}) {
    blogs.removeWhere((blog) => blog.id == id);
    box.write("blogs", blogs);
  }
  toggleFavorite({required int id}){
    var blog = blogs.firstWhere((e)=>e.id == id).isFavorite ;
    blogs.firstWhere((e)=>e.id == id).isFavorite = !blog!;
    box.write("blogs", blogs);

  }

  loadBlogs() {
    if (box.hasData("blogs")) {
      for (var element in box.read("blogs")) {
        blogs.add(BlogModel.fromJson(element));
      }
    }
  }
}
