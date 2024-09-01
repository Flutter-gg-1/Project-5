class UserModel {
  UserModel({
    required this.username,
    required this.flag,
    required this.savedPosts,
    required this.userPosts,
  });

  String username;
  bool flag;
  List<Map<String, dynamic>> savedPosts;
  List<Map<String, dynamic>> userPosts;

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      username: json['username'] ?? '',
      flag: json['flag'] ?? false,
      savedPosts: json['savedPosts'] != null
          ? List<Map<String, dynamic>>.from(json['savedPosts'])
          : [],
      userPosts: json['userPosts'] != null
          ? List<Map<String, dynamic>>.from(json['userPosts'])
          : [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'flag': flag,
      'savedPosts': savedPosts,
      'userPosts': userPosts,
    };
  }
}
