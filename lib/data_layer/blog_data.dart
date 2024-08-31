import 'package:get_storage/get_storage.dart';

import '../model/blog_data_model.dart';

class BlogData {
  List<BlogDataModel> blogData = [];
  final box = GetStorage();

  BlogData(){
    loadBlogs();
  }

  addBlogPost({required BlogDataModel blog}) async {
    blogData.add(blog);
    await box.write("blogs", blogData);
  }

  loadBlogs(){
    if(box.hasData("blogs")){
    for (var element in box.read("blogs")) {
      blogData.add(BlogDataModel.fromJson(element));
    }
  }
  }

  removeBlog({required int id}) {
    blogData.firstWhere((blog) => blog.id == id);
    box.write("blogs", blogData);
  }
}