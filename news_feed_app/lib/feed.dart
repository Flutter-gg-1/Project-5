import 'package:flutter/material.dart';

class FeedPage extends StatelessWidget {
  const FeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff111111),
      appBar:AppBar(
          leading: IconButton(
            icon: const Icon(Icons.abc, color: Colors.white), 
            onPressed: () {},
          ),
        backgroundColor: const Color.fromARGB(0, 33, 149, 243),
          actions: [
            IconButton(
              icon: const Icon(Icons.search, color: Colors.white),
              onPressed: () {},
          ),
        ],
         
          
      ),
      body: Center(
        child: Column(
          children: [

          ],
        ),
      ),
    );
  }
}