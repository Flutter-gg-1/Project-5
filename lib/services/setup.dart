
import 'package:blog_app/data/app_data.dart';
import 'package:get_it/get_it.dart';

void setup() {

  GetIt.I.registerSingleton<AppData>(AppData());
}