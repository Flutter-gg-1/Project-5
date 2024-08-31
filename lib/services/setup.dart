import 'package:blog_app_project/data/blog_data.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setup() {
  //GetIt.I.registerSingleton<BlogData>(BlogData());
  getIt.registerSingleton<BlogData>(BlogData());
}
