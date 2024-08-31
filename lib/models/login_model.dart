class LoginModel {
  LoginModel({
    required this.loginName,
    required this.isLoggedIn,
  });

  final String? loginName;
  bool? isLoggedIn;

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      loginName: json["loginName"],
      isLoggedIn: json["isLoggedIn"],
    );
  }

  Map<String, dynamic> toJson() =>
      {"loginName": loginName, "isLoggedIn": isLoggedIn};
}
