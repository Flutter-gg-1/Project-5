import 'package:get_it/get_it.dart';
import 'package:project/User_task/user_task.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<UserTask>(UserTask());
}
