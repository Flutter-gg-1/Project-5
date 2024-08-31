import 'package:blog_app/data/blog_data.dart';
import 'package:blog_app/data/user_data.dart';
import 'package:get_it/get_it.dart';

void setup() {
  GetIt.I.registerSingleton<UserData>(UserData());
  GetIt.I.registerSingleton<BlogData>(BlogData());
}
