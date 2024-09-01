class UserModel {
  final String username;
  final String password;
  final List<int> favoritePostIds;
  bool loggedInbool;

  UserModel({
    this.username = 'Kyle Barr',
    this.password = '123',
    List<int>? favoritePostIds,
    bool loggedIn = false,
  })  : favoritePostIds = favoritePostIds ?? [],
        loggedInbool = loggedIn;


  bool get loggedIn => loggedInbool;

  void addFavorite(int postId) {
    if (!favoritePostIds.contains(postId)) {
      favoritePostIds.add(postId);
    }
  }

  void removeFavorite(int postId) {
    favoritePostIds.remove(postId);
  }

  bool isFavorite(int postId) {
    return favoritePostIds.contains(postId);
  }

  void logIn() {
    loggedInbool = true; 
  }

  void logOut() {
    loggedInbool = false; 
  }
}