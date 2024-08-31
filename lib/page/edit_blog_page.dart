import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pro_5/widget/textfield_widget.dart';

class EditBlogPage extends StatelessWidget {
  const EditBlogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(

            backgroundColor: const Color(0xff111111),



            appBar: AppBar(
        backgroundColor: const Color(0xff1E1E1E),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          GestureDetector(
            onTap: () {},
            child: const Text(
              "Save",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 17),
            ),
          ),
        ],
      ),



      body: SingleChildScrollView(


        child: Padding(
          padding: const EdgeInsets.only(left:  17),
          child: Column(

            crossAxisAlignment: CrossAxisAlignment.start,
          
          
            children: [

               const SizedBox(
                height: 30,
              ),



               Text(
                "Title",
                style: GoogleFonts.inter(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 17),
              ),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.only(right: 20),
                child: TextfieldWidget(
                  hint: "Enter your blog title",
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                "Summary",
                style: GoogleFonts.inter(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 17),
              ),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.only(right: 20),
                child: SizedBox(
                  height: 100,
                  child: TextfieldWidget(
                    texLine: 10,
                    hint: "Give a brief summary about your blog ",
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                "Content",
                style: GoogleFonts.inter(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 17),
              ),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.only(right: 20),
                child: SizedBox(
                  height: 200,
                  child: TextfieldWidget(
                    texLine: 10,
                    hint: "write your blog here",
                  ),
                ),
              ),
              
            ],
          ),
        ),
      ),




    );
  }
}