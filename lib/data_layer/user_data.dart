import 'package:blog_app/data_layer/blog_data.dart';
import 'package:blog_app/model/blog_model.dart';
import 'package:blog_app/model/user_model.dart';
import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';

class UserData {
  final blogDataLocator = GetIt.I.get<BlogData>();
  List<UserModel> users = [];
  List<BlogModel> markedBlogs = [];
  late String currentUser;
  bool isGust = false;
  final box = GetStorage();
  UserData() {
    loadStatus();
  }
  Future<void> changeUserStatus({required String username}) async {
    await box.write('currentUser', username);
    await box.write('login', true);
  }

  guestLogin() async {
    isGust = false;
    await box.write('login', false);
  }

  loadStatus() async {
    isGust = await box.read('login');
    currentUser = await box.read('currentUser');
  }
}
