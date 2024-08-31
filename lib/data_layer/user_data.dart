import 'package:get_storage/get_storage.dart';

import '../model/user_data_model.dart';

class UserData {
  List<UserDataModel> userData = [];
  final box = GetStorage();
  bool isLogin = false;
  

  addUser({required UserDataModel user}){
    userData.add(user);
    saveUserDetail();
  }

  bool get isLogedIn{
    if(isLogin == true){
      return box.read("islogin");
    }
    else{
      return isLogin = false;
    }
  }

  logIn({required String userName, required String password}) async {
    loadData();
    for (var element in userData) {
      if(element.userName == userName && element.password == password){
        await box.write("islogin", true);
        await box.write("userName", userName);
        isLogin = true;
        return true;
      }
    }
    return false;
  }
  saveUserDetail() async{
    List<Map<String, dynamic>> saveData = [];
    for (var element in userData) {
      saveData.add(element.toJson());
    }
    await box.write("userData", saveData);
  }

  get currentUser { 
    return box.read('userName');
    }

  loadData() {
    if(box.hasData("userData")){
      List<Map<String, dynamic>> loadData = List.from(box.read("userData")).cast<Map<String, dynamic>>();
      for (var element in loadData) {
        userData.add(UserDataModel.fromJson(element));
      }
    }
  }

}