import 'package:flutter/material.dart';

class SaveListScreen extends StatefulWidget {
  const SaveListScreen({super.key});

  @override
  State<SaveListScreen> createState() => _SaveListScreenState();
}

class _SaveListScreenState extends State<SaveListScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xff111111),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Saved News",
                  style: TextStyle(color: Colors.white, fontSize: 20,
                  fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 300,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "No news found",
                      style: TextStyle(color: Color(0xffB8B8B8)),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
