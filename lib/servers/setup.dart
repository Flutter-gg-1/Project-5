import 'package:get_it/get_it.dart';
import 'package:project_5/servers/user_data_servers.dart';

final getIt = GetIt.instance;
Future<void> setup() async {
  getIt.registerSingleton<UserDataServers>(UserDataServers());
}
