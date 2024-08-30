import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../widgets/custom_text/custom_text.dart';

class WatchosDetails extends StatelessWidget {
  const WatchosDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff111111),
      appBar: AppBar(
        backgroundColor: const Color(0xff1E1E1E),
        leading: const Icon(
          Icons.arrow_back_ios_new,
          color: Colors.white,
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: Icon(
              Icons.text_increase_outlined,
              color: Colors.white,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: Icon(
              Icons.bookmark_border,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 266,
              width: 470,
              child: Image.asset(
                "assets/watch-large.png",
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      Icon(
                        Icons.pivot_table_chart_outlined,
                        color: Color(0xffBDA6F5),
                      ),
                      Text(
                        "Technology",
                        style:
                            TextStyle(color: Color(0xffBDA6F5), fontSize: 14),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const CustomText( text: 
                    "WatchOS 10 preview: widgets all the way down",
                        color: Colors.white,
                        size: 20,
                        fontWeight: FontWeight.bold),
                  const SizedBox(
                    height: 8,
                  ),
                  Image.asset(
                    "assets/Vector-6.png",
                    width: 28,
                    height: 28,
                  ),
                  const CustomText(text: "Jeremy Morgan",
                          color: Color(0xffB8B8B8),
                          fontWeight: FontWeight.bold,
                          size: 14),
                  const SizedBox(
                    height: 20,
                  ),
                  const CustomText(text:  "4 min read • Jul 10, 2023",
                          color: Colors.white,
                          size: 12,
                          fontWeight: FontWeight.w500),
                  const SizedBox(
                    height: 16,
                  ),
                  const Row(
                    children: [
                      Icon(
                        BoxIcons.bxl_facebook,
                        color: Color(0xffCFCFCF),
                      ),
                      Icon(BoxIcons.bxl_twitter, color: Color(0xffCFCFCF)),
                       Icon(BoxIcons.bx_link, color: Color(0xffCFCFCF)),
                    ],
                  ),
                  const SizedBox(
                    height: 79,
                  ),
                  const CustomText(text:  "Summary",
                          color: Colors.white,
                          size: 16,
                          fontWeight: FontWeight.bold),
                  const SizedBox(
                    height: 20,
                  ),
                  const CustomText(text: 
                      "Apple’s watchOS 10 introduces a major update focused on a widget-centric interface, significantly enhancing user interaction with the Apple Watch. The new features include customizable watch faces with stackable widgets, improved navigation, and expanded global availability, making it easier for users to access and manage information. ",
                      color: Color(0xffB8B8B8),
                      size: 14,
                      fontWeight: FontWeight.w500),
                  const SizedBox(
                    height: 20,
                  ),
                  const CustomText( text: 
                    "Content",
                        color: Colors.white,
                        size: 16,
                        fontWeight: FontWeight.bold),
                  const SizedBox(
                    height: 30,
                  ),
                  const CustomText(text: 
                      "watchOS 10 brings a fresh approach to the Apple Watch experience by emphasizing widgets. Users can now stack, resize, and rearrange widgets directly on their watch faces, offering quick access to essential information like weather, calendar events, and health metrics. This update also introduces more interactive and efficient navigation, integrating widgets into the Control Center for better management of settings and features. Health and fitness widgets provide immediate insights into key metrics such as heart rate and activity levels, enhancing wellness tracking. Additionally, watchOS 10 is being rolled out to a global audience, including new regions like the European Economic Area and Brazil, broadening the reach and impact of these advanced features.",
                      color: Color(0xffB8B8B8),
                      size: 14,
                      fontWeight: FontWeight.w500)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}