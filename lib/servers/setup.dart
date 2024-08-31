import 'package:get_it/get_it.dart';
import '../core/all_file.dart';

final getIt = GetIt.instance;
Future<void> setup() async {
  getIt.registerSingleton<UserDataServers>(UserDataServers());
  getIt.registerSingleton<ArticleDataServers>(ArticleDataServers());
}
