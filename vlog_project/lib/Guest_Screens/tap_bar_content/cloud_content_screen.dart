import 'package:flutter/material.dart';
import 'package:vlog_project/Guest_Screens/full_page_news_screen.dart';
import 'package:vlog_project/widget/card_view_viedo.dart';

class CloudContentScreen extends StatelessWidget {
  const CloudContentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(

 backgroundColor: const Color(0xff111111),
      body: SingleChildScrollView(
        // Makes the content scrollable
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
                        )),
                    const Positioned(
                        top: 190,
                        child: Text(
                          "  A month with DJI Mini 3 Pro",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        )),
                    const Positioned(
                        top: 180,
                        right: 10,
                        child: Icon(
                          Icons.arrow_outward_sharp,
                          color: Colors.white,
                        ))
                  ],
                )
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
                      fontSize: 16),
                ),
                SizedBox(width: 300),
                Text(
                  "See all",
                  style: TextStyle(color: Colors.grey),
                )
              ],
            ),
            const SizedBox(height: 10),
            const CardView(
              screentogo: FullPageNews(),
              title: "The Verge • Tech",
              subtitle:"Instagram’s Threads surpasses\n100 million users!",
              date: "Jul 10, 2023 • 4 min read",
              imagePath: "assets/google.png",
            ),
            const SizedBox(height: 10),
            const CardView(
              screentogo: FullPageNews(),
                title: "The Verge • shopping",
                subtitle: "July 2023: The best early\nPrime Day deals!",
                date: "Jul 12, 2023 • 5 min read",
                imagePath: "assets/smart_watch.png"),
            const SizedBox(height: 10),
            const CardView(
              screentogo: FullPageNews(),
                title: "BBC News • Weather",
                subtitle: "Flood warning in Delhi as rains\nbatter north India",
                date: "Jul 11, 2023 • 2 min read",
                imagePath: "assets/men.png"),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
