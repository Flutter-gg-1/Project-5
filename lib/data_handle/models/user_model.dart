import 'dart:developer';

class UserModel {
  final String name;
  final String passowrd;
  final bool isGust;

  static int classId = 3;

  late final int id;

  

  UserModel(
      {required this.name, required this.passowrd, required this.isGust}) {
    if (isGust == true) {
      id = 0;
    } else {
      id = classId;

      classId += 1;
    }

    log("id user is : $id");
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        name: json["name"], passowrd: json["passowrd"], isGust: json["isGust"]);
  }

  Map<String, dynamic> toJson() {
    return {


      "name" :name,
      "passowrd" :passowrd,
      "isGust" :isGust,
      
    };
  }
}
