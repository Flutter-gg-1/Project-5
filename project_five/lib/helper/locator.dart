import 'package:blogs_app/data/services/auth_service.dart';
import 'package:blogs_app/data/services/blog_service.dart';
import 'package:get_it/get_it.dart';

final GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton<BlogService>(() => BlogService());
  locator.registerLazySingleton<AuthService>(() => AuthService());
}
