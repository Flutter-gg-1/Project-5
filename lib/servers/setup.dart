import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';
import '../core/all_file.dart';

final getIt = GetIt.instance;
Future<void> setup() async {
  await GetStorage.init();
  getIt.registerSingleton<UserDataServers>(UserDataServers());
  getIt.registerSingleton<ArticleDataServers>(ArticleDataServers());
}
