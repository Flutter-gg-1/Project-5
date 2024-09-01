import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import '../../managers/blog_mgr.dart';
import '../../managers/nav_mgr.dart';
import '../../managers/user_mgr.dart';
import '../../model/blog.dart';
import '../../model/user.dart';

class AccountVM {
  final userMgr = GetIt.I.get<UserMgr>();
  final blogMgr = GetIt.I.get<BlogMgr>();
  final navMgr = GetIt.I.get<NavMgr>();

  User? get currentUser => userMgr.currentUser;
  List<Blog> get blogs => blogMgr.userBlogs;

  Future<void> removeBlog({required int blogId}) async {
    await removeRelatedBookmarks(blogId);
    blogMgr.removeBlog(blogId: blogId);
  }

  Future<void> removeRelatedBookmarks(int blogId) async {
    var allBookmarks = userMgr.allBookmarks;
    for (var bookmark in allBookmarks) {
      if (bookmark.blogId == blogId) {
        await userMgr.deleteBookmark(bookmark);
      }
    }
  }

  void signOut(BuildContext context) {
    userMgr.setCurrentUser(user: currentUser, isSignIn: false);
    navMgr.signOut(context: context);
  }
}
