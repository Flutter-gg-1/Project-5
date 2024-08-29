class User {
  int id;
  String name;
  String jobTitle;
  String avatarData;

  User({
    required this.id,
    required this.name,
    required this.jobTitle,
    required this.avatarData,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      jobTitle: json['jobTitle'],
      avatarData: json['avatarData'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'jobTitle': jobTitle,
        'avatarData': avatarData,
      };

  static var defaultUsers = [
    User(
      id: 0,
      name: 'Kyle Barr',
      jobTitle: 'Software developer',
      avatarData: '',
    ),
    User(
      id: 1,
      name: 'John Doe',
      jobTitle: 'Magician',
      avatarData: '',
    ),
  ];
}
