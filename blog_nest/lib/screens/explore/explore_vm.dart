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
            .where(
              (blog) => (blog.title
                      .toLowerCase()
                      .contains(searchText.toLowerCase()) ||
                  blog.category
                      .titleStr()
                      .toLowerCase()
                      .contains(searchText.toLowerCase()) ||
                  blog.category
                      .tabStr()
                      .toLowerCase()
                      .contains(searchText.toLowerCase())),
            )
            .toList();
  }
}
