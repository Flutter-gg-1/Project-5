import 'package:blog_nest/managers/user_mgr.dart';
import 'package:blog_nest/model/bookmark.dart';
import 'package:get_it/get_it.dart';
import '../../managers/blog_mgr.dart';
import '../../model/blog.dart';

class BookmarksVM {
  final List<Blog> allBlogs = GetIt.I.get<BlogMgr>().allBlogs;
  final userMgr = GetIt.I.get<UserMgr>();

  List<Bookmark> get userBookMarks {
    int? userId = userMgr.currentUser?.id;
    return userId == null
        ? []
        : userMgr.allBookmarks
            .where((bookmark) => (bookmark.userId == userId))
            .toList();
  }

  List<Blog> get blogs {
    List<int> bookmarkedBlogIds =
        userBookMarks.map((bookmark) => bookmark.blogId).toList();
    return allBlogs
        .where((blog) => bookmarkedBlogIds.contains(blog.id))
        .toList();
  }
}
