class UserDataModel {
  late final String userName;
  late final String password;
  UserDataModel({required this.userName, required this.password});

  UserDataModel.fromJson(Map<String, dynamic> json){
    userName = json["userName"];
    password = json["password"];
  }

  Map<String, dynamic> toJson(){
    final data = <String, dynamic>{};
    data["userName"] = userName;
    data["password"]=password;
    return data; 
  }
}