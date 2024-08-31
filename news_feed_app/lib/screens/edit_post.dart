import 'package:flutter/material.dart';
import 'package:news_feed_app/widgets/custom_textfeild.dart';

class EditPost extends StatelessWidget {
  const EditPost({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff111111),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white), 
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: const Color.fromARGB(0, 33, 149, 243),
        actions: [
        ElevatedButton(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(const Color(0xff111111)), // Use a solid color
        ),
        onPressed: () {},
        child: const Text(
          'Save',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Color(0xffffffff)),
        ),
      )
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
          child: ListView(
            children: const [
              TextContainer(title: 'Title', hint: '', titleSize: 16, titleWeight: FontWeight.w700, unlimittedLines: true,),
              SizedBox(height: 30,),
              TextContainer(title: 'Summary', hint: '', titleSize: 16, titleWeight: FontWeight.w700, unlimittedLines: true,),
              SizedBox(height: 30,),
              TextContainer(title: 'Content', hint: '', titleSize: 16, titleWeight: FontWeight.w700, unlimittedLines: true,),

            ],
          ),
        )
      ),
    );
  }
}