import 'package:get_storage/get_storage.dart';

class AuthService {
  final GetStorage storage = GetStorage();

  bool isLoggedIn() {
    return storage.read('loggedIn') ?? false;
  }

  bool isGuest() {
    return storage.read('isGuest') ?? false;
  }

  void login(String username, String password) {
    storage.write('loggedIn', true);
    storage.write('isGuest', false);
  }

  void loginAsGuest() {
    storage.write('loggedIn', false);
    storage.write('isGuest', true);
  }

  void logout() {
    storage.write('loggedIn', false); 
    storage.write('isGuest', false); 
  }
}
