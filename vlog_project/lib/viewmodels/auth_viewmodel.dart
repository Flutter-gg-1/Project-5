import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class AuthViewModel extends ChangeNotifier {
  final GetStorage _storage = GetStorage();
  static const String _loggedInKey = "isLoggedIn";

  bool get isLoggedIn => _storage.read(_loggedInKey) ?? false;

  void login() {
    _storage.write(_loggedInKey, true);
    notifyListeners();
  }

  void logout() {
    _storage.remove(_loggedInKey);
    notifyListeners();
  }
}
