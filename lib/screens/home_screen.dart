import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff1E1E1E),
          leading: const Icon(
            Icons.menu,
            color: Colors.white,
          ),
          actions: const [
            Icon(
              Icons.search,
              color: Colors.white,
            ),
            SizedBox(
              width: 10,
            ),
          ],
          bottom: const TabBar(tabs: [
            Text("Tech"),
            Text("AI"),
            Text("Cloud"),
            Text("Robotics"),
            Text("IoT"),
          ]),
        ),
        body: const TabBarView(children: [
          Column(
            children: [Text("data1")],
          ),
          Column(
            children: [Text("data2")],
          ),
          Column(
            children: [Text("data3")],
          ),
          Column(
            children: [Text("data4")],
          ),
          Column(
            children: [Text("data5")],
          ),
        ]));
  }
}
