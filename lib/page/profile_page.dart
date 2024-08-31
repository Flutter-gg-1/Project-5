import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff111111),
      appBar: AppBar(
        backgroundColor: const Color(0xff111111),
        title: Padding(
          padding: const EdgeInsets.only(top: 38, left: 10),
          child: Text(
            "Account",
            style: GoogleFonts.inter(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),



      body: SingleChildScrollView(


        child: Column(

          children: [

            SizedBox(height:30 ,),

            Padding(
              padding: const EdgeInsets.only(left: 24),
              child: Row(
              
                children: [
              
                  Container(
                    width: 56,
                    height: 56,
              
                    decoration: BoxDecoration(
              
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6)
                    ),

                    child: Image.asset("name"),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
