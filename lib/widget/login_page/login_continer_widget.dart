import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pro_5/page/home_page.dart';
import 'package:pro_5/page/navbar_page.dart';
import 'package:pro_5/widget/login_page/gust_row_widget.dart';
import 'package:pro_5/widget/textfield_widget.dart';

class LoginContinerWidget extends StatelessWidget {
  const LoginContinerWidget({
    super.key,
  });

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
            const Padding(
              padding: EdgeInsets.only(right: 16),
              child: TextfieldWidget(),
            ),
            const SizedBox(height:20 ,),
            Text("Password",
                style: GoogleFonts.inter(
                  color: Colors.white, fontWeight: FontWeight.bold
                )),
                const SizedBox(height:5 ,),
            const Padding(
              padding: EdgeInsets.only(right: 16),
              child: TextfieldWidget(),
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
              child: SizedBox(
                height: 35,
                width: 170,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xffBDA6F5).withOpacity(0.71),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5))),
                  onPressed: () {

                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) {


                      return const NavbarPage();
                      
                    },));
                  },
                  child: Text(
                    "Login",
                    style: GoogleFonts.inter(color: Colors.white),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20,),
            const GustRowWidget()
          ],
        ),
      ),
    );
  }
}

