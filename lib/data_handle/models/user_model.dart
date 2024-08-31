







class UserModel{

  final String name;
  final String passowrd;
  final bool isGust;

  static int  classId = 0 ;

  late final int id;

  // final List<int> likedBlog = [];
  // final List<int> doneBlog = [];

  UserModel( {required this.name, required this.passowrd, required  this.isGust}){


    id= classId;

    classId += 1;
  }




  


}