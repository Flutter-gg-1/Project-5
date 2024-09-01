import 'package:get_it/get_it.dart';
import '../../managers/blog_mgr.dart';
import '../../managers/nav_mgr.dart';
import '../../managers/user_mgr.dart';
import '../../model/bookmark.dart';
import '../../model/user.dart';

class BlogDetailsVM {
  final navMgr = GetIt.I.get<NavMgr>();
  final blogMgr = GetIt.I.get<BlogMgr>();
  final userMgr = GetIt.I.get<UserMgr>();

  get users => userMgr.allUsers;
  get blog => blogMgr.selectedBlog;
  User? get currentUser => userMgr.currentUser;

  BlogDetailsVM() {
    _fetchBookmarks();
  }

  List<Bookmark> bookmarks = [];

  void _fetchBookmarks() {
    bookmarks = userMgr.allBookmarks
        .where((bookmark) => (bookmark.userId == currentUser?.id))
        .toList();
  }

  bool isBookmarked(int blogId) {
    return bookmarks.any((bookmark) => bookmark.blogId == blogId);
  }

  void toggleBookmark(int blogId) {
    userMgr.toggleBookmark(blogId: blogId);
    _fetchBookmarks();
  }

  User get author {
    return users
        .where((user) => user.id == blog?.authorId)
        .toList()
        .firstWhere((user) => true);
  }
}
