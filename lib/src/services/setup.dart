import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';
import 'package:project_5/src/data_layer/post_data.dart';
import 'package:project_5/src/data_layer/user_data.dart';

Future<void> setup() async {
  await GetStorage.init();
  GetIt.I.registerSingleton<UserData>(UserData());
  GetIt.I.registerSingleton<PostData>(PostData());
}
