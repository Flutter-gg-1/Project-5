




import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SavedPage extends StatelessWidget {
  const SavedPage({super.key});

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



              body: Center(child: Text("No news found", style: GoogleFonts.inter(color: Color(0xffB8B8B8)  ,fontSize: 20),)),





    );
  }
}