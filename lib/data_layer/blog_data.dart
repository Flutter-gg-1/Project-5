import 'package:blog_app/model/blog_model.dart';
import 'package:get_storage/get_storage.dart';

class BlogData {
  List<BlogModel> blogs = [];
  final box = GetStorage();
}