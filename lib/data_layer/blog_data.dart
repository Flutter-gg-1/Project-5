import 'package:get_storage/get_storage.dart';

import '../model/blog_data_model.dart';

class BlogData {
  List<BlogDataModel> blogData = [];
  final box = GetStorage();

  addBlogPost({required BlogDataModel blog}){
    blogData.add(blog);
  }

}