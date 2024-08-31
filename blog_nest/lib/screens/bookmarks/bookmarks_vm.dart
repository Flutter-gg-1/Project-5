import 'package:get_it/get_it.dart';
import '../../managers/blog_mgr.dart';
import '../../model/blog.dart';

class BookmarksVM {
  final List<Blog> blogs = GetIt.I.get<BlogMgr>().allBlogs;
}
