import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';
import 'package:project5/data_layer/user_data.dart';

import '../data_layer/blog_data.dart';

Future<void> setup() async {
  await GetStorage.init();
  GetIt.I.registerSingleton<BlogData>(BlogData());
  GetIt.I.registerSingleton<UserData>(UserData());
}