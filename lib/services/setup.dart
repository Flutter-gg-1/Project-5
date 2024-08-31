import 'package:blog_app/data/blog_data.dart';
import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';

final locator = GetIt.instance;
Future<void> setup() async {
  await GetStorage.init();
  locator.registerSingleton<BlogData>(BlogData());
}
