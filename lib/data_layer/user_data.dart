import 'package:get_storage/get_storage.dart';

import '../model/user_data_model.dart';

class UserData {
  List<UserDataModel> userData = [];
  final box = GetStorage();
  
  bool isLogedIn(){
    if(box.hasData("islogin")){
    return true;
    }
    else{
      return false;
    }
  }

  logIn({required String userName, required String password}) {
    loadData();
         box.write("islogin", true);
         box.write("userName", userName);
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

  logOut() {
    box.remove("islogin");
  }

}