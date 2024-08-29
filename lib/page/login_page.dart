import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pro_5/widget/login_continer_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: const Color(0xff111111),
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.only(left: 19),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                const SizedBox(height:140 ,),
                 Text(
                  "Welcome Back!",
                  style: GoogleFonts.inter(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),
                ),
                 Text(
                  "Glad to see you again",
                  style: GoogleFonts.inter(color: Colors.white),
                ),
        
               const  SizedBox(height: 30,),
                const LoginContinerWidget()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

