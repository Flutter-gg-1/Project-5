import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';
import 'package:project_5/data_layer/blog_data.dart';
import 'package:project_5/data_layer/login_data.dart';

final getIt = GetIt.instance;

Future<void> setup() async {
  await GetStorage.init();
  getIt.registerSingleton<LoginData>(LoginData());
  getIt.registerSingleton<BlogData>(BlogData());
}
