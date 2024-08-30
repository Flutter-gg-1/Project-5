import 'package:blog_app/data_layer/get_blog.dart';
import 'package:get_it/get_it.dart';

Future<void> setup() async {
  GetIt.I.registerSingleton<GetBlog>(GetBlog());
}
