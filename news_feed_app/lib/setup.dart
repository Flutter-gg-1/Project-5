import 'package:get_it/get_it.dart';
import 'package:news_feed_app/data/models/profile_data_model.dart';
import 'package:news_feed_app/data/post_data.dart';



Future<void> setup() async {
  //await GetStorage.init();
  GetIt.I.registerSingleton<PostData>(PostData());
  GetIt.I.registerSingleton<UserModel>(UserModel());
}
