import 'package:flutter/material.dart';
import 'package:vlog_project/screens/User_Screens/blog_details_screen.dart';
import 'package:vlog_project/widget/guest_card_view.dart';

class ExploreUserScreen extends StatelessWidget {
  const ExploreUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff111111),
        body: Column(
          children: [
            SizedBox(
              height: 80,
            ),
            SizedBox(
                width: 450,
                child: TextField(
                  decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),
                      hintText: "Google",
                      filled: true,
                      fillColor: const Color(0xff393939),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 10),
                      hintStyle: const TextStyle(color: Colors.white)),
                  style: const TextStyle(color: Colors.white),
                )),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const GuestCardView(
                  screentogo: UserBlogPageWithEdit(),
                  title: "Kyle Barr",
                  subtitle:
                      "Now Google’s Bard AI can talk\n& respond to visual prompts",
                  date: "Jul 13, 2023 • 2 min read",
                  imagePath: "assets/google.png",
                ),
              ],
            )
          ],
        ));
  }
}
