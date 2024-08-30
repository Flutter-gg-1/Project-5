import 'package:flutter/material.dart';

class BlogPage extends StatelessWidget {
  const BlogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff111111),
      appBar:AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.white), 
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        backgroundColor: const Color.fromARGB(0, 33, 149, 243),
          actions: [
            IconButton(
              icon: const Icon(Icons.text_fields, color: Colors.white), 
              onPressed: () {
              },
            ),
          IconButton(
            icon: const Icon(Icons.save, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
         Image.asset('assets/placeholder_image.png'),
         const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
         child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('TECHNOLOGY', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600 ,color: Color(0xffffffff)),),
          ],
         ))
      
        ],
      ),
    );
  }
}