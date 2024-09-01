import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vlog_project/service/blog_service.dart';

final GetIt getIt = GetIt.instance;

Future<void> setupLocator() async {

  await GetStorage.init();


  getIt.registerLazySingleton<BlogService>(() => BlogService());

}
