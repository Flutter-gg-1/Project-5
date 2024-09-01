import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vlog_project/service/blog_service.dart';

// Import other services as needed

final GetIt getIt = GetIt.instance;

Future<void> setupLocator() async {
  // Initialize GetStorage
  await GetStorage.init();

  // Register services
  getIt.registerLazySingleton<BlogService>(() => BlogService());

  // Register other services here
}
