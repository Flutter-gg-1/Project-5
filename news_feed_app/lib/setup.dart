import 'package:get_it/get_it.dart';
import 'package:news_feed_app/post_data.dart';



Future<void> setup() async {
  //await GetStorage.init();
  GetIt.I.registerSingleton<PostData>(PostData());
}
