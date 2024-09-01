import 'package:flutter/material.dart';
import 'package:vlog_project/screens/Guest_Screens/full_page_news_screen.dart';
import 'package:vlog_project/widget/guest_card_view.dart'; // Import GuestCardView

class AiContntScreen extends StatelessWidget {
  const AiContntScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff111111),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Stack(
                  children: [
                    Image.asset(
                      "assets/drone_biger.png",
                      width: 430,
                    ),
                    const Positioned(
                      top: 160,
                      child: Text(
                        "  DJI • Jul 10, 2023",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const Positioned(
                      top: 190,
                      child: Text(
                        "  A month with DJI Mini 3 Pro",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const Positioned(
                      top: 180,
                      right: 10,
                      child: Icon(
                        Icons.arrow_outward_sharp,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10),
            const SizedBox(
              width: 450, // Set a fixed width for the divider
              child: Divider(
                color: Colors.grey,
                thickness: 1,
              ),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Top Stories",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SizedBox(width: 300),
                Text(
                  "See all",
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const GuestCardView(
              screentogo: GuestBlogPage(),
              title: "Kyle Barr",
              subtitle: "Now Google’s Bard AI can talk\n& respond to visual prompts",
              date: "Jul 13, 2023 • 2 min read",
              imagePath: "assets/instagram.png",
            ),
            const SizedBox(height: 10),
            const GuestCardView(
              screentogo: GuestBlogPage(),
              title: "Jeremy Morgan",
              subtitle: "WatchOS 10 preview: widgets\nall the way down",
              date: "Jul 10, 2023 • 4 min read",
              imagePath: "assets/desk.png",
            ),
            const SizedBox(height: 10),
            const GuestCardView(
              screentogo: GuestBlogPage(),
              title: "Amber Israelsen",
              subtitle: "How Gen Z are disrupting the\ndefinition of ‘prestigious’ jobs",
              date: "Jul 24, 2023 • 8 min read",
              imagePath: "assets/bus.png",
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
