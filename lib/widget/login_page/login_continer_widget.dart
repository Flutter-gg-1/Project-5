import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pro_5/data_handle/git_it/setup.dart';
import 'package:pro_5/data_handle/models/app_model.dart';
import 'package:pro_5/page/home_page.dart';
import 'package:pro_5/page/navbar_page.dart';
import 'package:pro_5/widget/button_widget.dart';
import 'package:pro_5/widget/login_page/gust_row_widget.dart';
import 'package:pro_5/widget/textfield_widget.dart';

class LoginContinerWidget extends StatefulWidget {
  const  LoginContinerWidget({
    super.key,
  });

  @override
  State<LoginContinerWidget> createState() => _LoginContinerWidgetState();
}

class _LoginContinerWidgetState extends State<LoginContinerWidget> {

  String name = "";

  String password = "";

  @override
  void initState() {



    
   
WidgetsBinding.instance.addPostFrameCallback((_) {
    if (getIt.get<AppModel>().userLogin != null) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) {
          return const NavbarPage();
        }),
      );
    }
  });




    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      height: 340,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: const Color(0xff1E1E1E)),
      child: Padding(
        padding: const EdgeInsets.only(left: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height:20 ,),
            Text("Username",
                style: GoogleFonts.inter(
                  color: Colors.white, fontWeight: FontWeight.bold
                )),
                const SizedBox(height:5 ,),
             Padding(
              padding: EdgeInsets.only(right: 16),
              child: TextfieldWidget(
                 

                 onChanged: (p0) {
                   name = p0;
                 },
                hint: "Enter your username",),
            ),
            const SizedBox(height:20 ,),
            Text("Password",
                style: GoogleFonts.inter(
                  color: Colors.white, fontWeight: FontWeight.bold
                )),
                const SizedBox(height:5 ,),
             Padding(
              padding: EdgeInsets.only(right: 16),
              child: TextfieldWidget(

                onChanged: (p0) {
                  password = p0;
                },
                
                hint: "Enter your password",),
            ),

            
            Padding(
              padding: const EdgeInsets.only(right: 20 , top: 5),
              child: Align(
                alignment: Alignment.centerRight,
                child: Text("forget password",
                    style: GoogleFonts.inter(
                      color: const Color(0xffBDA6F5),
                    )),
              ),
            ),

            const SizedBox(height: 34,),
            Align(
              alignment: Alignment.center,
              child: ButtonWidget(
                opacity: 0.71,

                onPressed: () {
                  
                   getIt.get<AppModel>().userLog(name: name, passowrd: password);
    
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) {
    
    
            return const NavbarPage();
            
          },));
                },
                
               
                
                ),
            ),
            const SizedBox(height: 20,),
            GestureDetector(

              onTap: () {


                 getIt.get<AppModel>().gustUserMain();

                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) {


                      return const NavbarPage();
                      
                    },));
                
              },
              
              
              
              child: const GustRowWidget())
          ],
        ),
      ),
    );
  }
}


