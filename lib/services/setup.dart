import 'package:blog_app/data_layer/user_data.dart';
import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';

Future<void> setup() async {
  //await GetStorage.init();
  GetIt.I.registerSingleton<UserData>(UserData());
}
