import 'package:get_storage/get_storage.dart';

import '../model/user_data_model.dart';

class UserData {
  List<UserDataModel> userData = [];
  final box = GetStorage();
  
  addUser({required UserDataModel user}){
    userData.add(user);
    saveUserDetail();
  }

  bool isLogedIn(){
    if(box.hasData("islogin")){
    return true;
    }
    else{
      return false;
    }
  }

  logIn({required String userName, required String password}) async {
    loadData();
        await box.write("islogin", true);
        await box.write("userName", userName);
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

  logOut() async {
    await box.remove("islogin");
  }

  

}