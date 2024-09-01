


import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:pro_5/widget/textfield_widget.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(


              backgroundColor: const Color(0xff111111),

              




              body: Column(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [

                  const Padding(
                    padding: EdgeInsets.only(top: 75,right: 20,left: 20),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: TextfieldWidget(hint: "Search for News",hasIcon: true,)),
                  ),
                  Expanded(
                    child: Center(
                    
                      
                      child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.search,color:Color(0xffB8B8B8) ,),
                        Text("Search for a news", style: GoogleFonts.inter(color: const Color(0xffB8B8B8)),),
                      ],
                    )),
                  ),
                ],
              ) ,

    );
  }
}