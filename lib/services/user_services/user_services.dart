class UserService {
  String? _currentUserName;

  bool get isLoggedIn => _currentUserName != null;
  bool get isGuest => _currentUserName == null;

  void setUserName(String? userName) {
    _currentUserName = userName;
  }

  String? getUserName() {
    return _currentUserName;
  }
}
