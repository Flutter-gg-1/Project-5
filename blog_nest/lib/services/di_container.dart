import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';
import '../managers/blog_mgr.dart';
import '../managers/user_mgr.dart';
import '../managers/nav_mgr.dart';

class DIContainer {
  static Future<void> setup() async {
    await GetStorage.init();

    GetIt.I.registerSingleton<UserMgr>(UserMgr());
    GetIt.I.registerSingleton<BlogMgr>(BlogMgr());
    GetIt.I.registerSingleton<NavMgr>(NavMgr());
  }
}
