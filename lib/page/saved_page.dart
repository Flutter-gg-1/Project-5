




import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pro_5/data_handle/git_it/setup.dart';
import 'package:pro_5/data_handle/models/app_model.dart';
import 'package:pro_5/data_handle/models/blog_data_model.dart';
import 'package:pro_5/widget/home_page/blog_card_widget.dart';

class SavedPage extends StatefulWidget {
  const SavedPage({super.key});

  @override
  State<SavedPage> createState() => _SavedPageState();
}

class _SavedPageState extends State<SavedPage> {


  List<BlogDataModel> userLikedLis = [];

  bool  islikeEmty = true;



@override
  void initState() {


    userLikedLis =   getIt.get<AppModel>().showLikedBlog();

    if(userLikedLis.isNotEmpty){
      islikeEmty = false;
    }
                          
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(


              backgroundColor: const Color(0xff111111),


              appBar: AppBar(


              backgroundColor: const Color(0xff111111),

              title: Padding(
                padding: const EdgeInsets.only(top: 38,left: 10),
                child: Text("Saved News", style: GoogleFonts.inter(color: Colors.white, fontWeight: FontWeight.bold),),
              ),


              ),



              body: islikeEmty == true ? Center(child: Text("No news found", style: GoogleFonts.inter(color: Color(0xffB8B8B8)  ,fontSize: 20),)) : 
              
              
              SingleChildScrollView(

                child: Column(

                children:    userLikedLis.map((e) {

                return  Center(child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: BlogCardWidget(blogDataModel: e,),
                ));
                
              },).toList(),
                ),



              )





    );
  }
}