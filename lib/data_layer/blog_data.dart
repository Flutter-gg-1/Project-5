import 'package:get_storage/get_storage.dart';

import '../model/blog_data_model.dart';

class BlogData {
  List<BlogDataModel> blogData = [];
  final box = GetStorage();

  BlogData(){
    loadBlogs();
  }

  addBlogPost({required BlogDataModel blog}) {
    blogData.add(blog);
    box.write("blogs", blogData);
  }

  loadBlogs(){
    if(box.hasData("blogs")){
    for (var element in box.read("blogs")) {
      blogData.add(BlogDataModel.fromJson(element));
    }
  }
  }

  removeBlog({required int id}) {
    blogData.removeWhere((blog) => blog.id == id);
    box.write("blogs", blogData);
  }

  changeSaveState({
    required int id,
  }) {
    for (var element in blogData) {
      if (element.id == id) {
        element.isSaved = !element.isSaved;
      }
    }
  }
  List<BlogDataModel> getSavedBlog() {
    return blogData.where((blog) => blog.isSaved).toList();
  }

    removeSavedBlog() {
    return blogData.remove((blog) => blog.isSaved);
  }
}