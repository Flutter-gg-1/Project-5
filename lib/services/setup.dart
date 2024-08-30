import 'package:get_it/get_it.dart';
import 'package:project5/data/all_posts.dart';

void setup() {
  GetIt.I.registerSingleton<AllPosts>(AllPosts());
}