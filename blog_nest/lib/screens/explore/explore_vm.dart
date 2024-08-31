import 'package:blog_nest/model/enum/blog_category.dart';
import 'package:get_it/get_it.dart';
import '../../managers/blog_mgr.dart';
import '../../model/blog.dart';

class ExploreVM {
  List<Blog> blogs = GetIt.I.get<BlogMgr>().allBlogs;
  String searchText = '';

  List<Blog> get filteredBlogs {
    return searchText == ''
        ? []
        : blogs
            .where((blog) => (blog.title.contains(searchText) ||
                blog.category.titleStr().contains(searchText) ||
                blog.category.tabStr().contains(searchText)))
            .toList();
  }
}
