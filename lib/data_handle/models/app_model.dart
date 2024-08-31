import 'dart:math';

import 'package:get_storage/get_storage.dart';
import 'package:pro_5/data_handle/models/blog_data_model.dart';
import 'package:pro_5/data_handle/models/user_model.dart';

class AppModel {
  final box = GetStorage();

  UserModel? userLogin;
  UserModel gustLogin = UserModel(name: "gust", passowrd: "", isGust: true);

  final List<UserModel> userList = [];

  List<BlogDataModel> blogList = [
    BlogDataModel(
      userId: 00000,
        title:
            "Now Google’s Bard AI Chatbot can talk & respond to visual prompts!",
        userName: "Kyle Barr",
        readingMin: "2 min read",
        summary: "Google is adding some new features to its Bard AI chatbot, ",
        content:
            "The feature that lets you add images to prompts is something that Google first showed off",
        date: "Jul 13, 2023",
        category: "Technology",
        img: "asset/img/Image.png"),
    BlogDataModel(
      userId: 000,
        title: "second blog is here my man!",
        userName: "Kyle Barr",
        readingMin: "2 min read",
        summary: "Google is adding some new features to its Bard AI chatbot, ",
        content:
            "The feature that lets you add images to prompts is something that Google first showed off",
        date: "Jul 13, 2023",
        category: "Technology",
        img: "asset/img/Image.png")
  ];





  void userLog({required String name, required String passowrd}) {
    if (userList.isEmpty) {
      userList.add(UserModel(name: name, passowrd: passowrd, isGust: false));

      userLogin = userList.first;
    } else {
      for (var val in userList) {
        if (val.name == name && val.passowrd == passowrd) {
          userLogin = val;
        }
      }

      var user = UserModel(name: name, passowrd: passowrd, isGust: false);

      userLogin = user;

      userList.add(user);
    }

    print(userList);
  }

  void addToList(BlogDataModel blogDataModel) {
    blogList.add(blogDataModel);
  }




  void addLiked(){



  }



  // int addDone(){

    

    

  // }


  bool isBlogLike({required BlogDataModel blogDataModel}){

   for(var val in blogDataModel.userLiked){

    if(val == userLogin!.id){
      return true;
    }
   }

   return false;

}



void updateBlogLike({required doLike ,  required BlogDataModel blog}){

  if(doLike == true){

    blog.userLiked.removeWhere((val) => val == userLogin!.id);

    
  }else{


    blog.userLiked.add(userLogin!.id);


  }

}



  List<BlogDataModel> showLikedBlog(){

  List<BlogDataModel> userLiked = [];


  for(var blog in blogList){

    for(var val in blog.userLiked){

      if(val == userLogin!.id){

        userLiked.add(blog);

      }

    }


    
  }

  return userLiked;


}
}