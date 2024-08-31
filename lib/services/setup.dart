import 'package:blog_app/data_layer/blog_data.dart';
import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';

final getIt = GetIt.instance;

Future<void> setup() async {
  await GetStorage.init();
  GetIt.I.registerSingleton<BlogData>(BlogData());
}
