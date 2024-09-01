import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SavedGuestScreen extends StatelessWidget {
  const SavedGuestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: Color(0xff111111),
        body: SafeArea(
            child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                SizedBox(
                  width: 5,
                ),
                Text(
                  "  Saved News",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: 350,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "No news found",
                  style: TextStyle(color: Colors.grey, fontSize: 20),
                )
              ],
            )
          ],
        )));
  }
}
