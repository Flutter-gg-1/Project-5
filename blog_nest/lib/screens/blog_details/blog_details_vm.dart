import 'package:get_it/get_it.dart';
import '../../managers/blog_mgr.dart';
import '../../managers/nav_mgr.dart';
import '../../managers/user_mgr.dart';
import '../../model/user.dart';

class BlogDetailsVM {
  final navMgr = GetIt.I.get<NavMgr>();
  final blog = GetIt.I.get<BlogMgr>().selectedBlog;
  final users = GetIt.I.get<UserMgr>().allUsers;
  final User? currentUser = GetIt.I.get<UserMgr>().currentUser;

  User get author {
    return users
        .where((user) => user.id == blog?.authorId)
        .toList()
        .firstWhere((user) => true);
  }
}
