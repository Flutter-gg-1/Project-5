import 'package:blog_nest/managers/user_mgr.dart';
import 'package:blog_nest/model/bookmark.dart';
import 'package:get_it/get_it.dart';
import '../../managers/blog_mgr.dart';
import '../../managers/nav_mgr.dart';
import '../../model/user.dart';

class BlogCellVM {
  final navMgr = GetIt.I.get<NavMgr>();
  final blogMgr = GetIt.I.get<BlogMgr>();
  var userMgr = GetIt.I.get<UserMgr>();

  User? get currentUser => userMgr.currentUser;
  List<Bookmark> bookmarks = [];

  BlogCellVM() {
    _fetchBookmarks();
  }

  void _fetchBookmarks() {
    bookmarks = userMgr.allBookmarks
        .where((bookmark) =>
            (bookmark.userId == currentUser?.id || bookmark.userId == null))
        .toList();
  }

  void toggleBookmark(int blogId) async {
    await userMgr.toggleBookmark(blogId: blogId);
    _fetchBookmarks();
  }
}
