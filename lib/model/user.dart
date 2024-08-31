class UserModel {
  late int id;
  late String name;
  late String username;
  late String email;
  late String password;

  UserModel({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.password,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      username: json['username'],
      email: json['email'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'username': username,
      'email': email,
      'password': password,
    };
  }
}
