import 'package:get_it/get_it.dart';
import 'package:project5/data/all_posts.dart';
import 'package:project5/data/all_users.dart';

void setup() {
  GetIt.I.registerSingleton<AllUsers>(AllUsers());
  GetIt.I.registerSingleton<AllPosts>(AllPosts());
}