import 'package:blog_app/data/post_data.dart';
import 'package:blog_app/data/user_data.dart';
import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';

var box = GetStorage();
Future<void> setup() async {
  await GetStorage.init();
  GetIt.I.registerSingleton<UserData>(UserData());
  GetIt.I.registerSingleton<PostData>(PostData());
}
