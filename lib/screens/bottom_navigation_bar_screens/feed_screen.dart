import 'package:flutter/material.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        backgroundColor: const Color(0xff111111),
        appBar: AppBar(
          leading: const Icon(Icons.menu, color: Color(0xffffffff), size: 28,),
          actions: const [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.search, color: Color(0xffffffff), size: 28,),
            )
          ],
          backgroundColor: const Color(0xff1E1E1E),
          bottom: const TabBar(tabs: [
            Text("Tech"),
            Text("AI"),
            Text("Cloud"),
            Text("Robotics"),
            Text("IoT"),
          ],
          indicatorColor: Color(0xffDD403C),
          indicatorSize: TabBarIndicatorSize.tab,
          unselectedLabelStyle: TextStyle(color: Color(0xff888888)),
          labelStyle: TextStyle(color: Colors.white, fontSize: 16),
          labelPadding: EdgeInsets.all(4),
          ),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Container(
                height: 180,
                width: 345,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: PageView(
                  children: [
                    Image.asset("name")
                  ],
                ),
              )
            ],
          )),
      ),
    );
  }
}