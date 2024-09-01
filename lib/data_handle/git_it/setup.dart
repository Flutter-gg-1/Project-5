import 'package:get_it/get_it.dart';
import 'package:pro_5/data_handle/models/app_model.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<AppModel>(AppModel());


  
}