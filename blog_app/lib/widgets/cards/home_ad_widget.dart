import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomLeft,
      padding: const EdgeInsets.all(10),
      width: 350,
      height: 180,
      decoration: const BoxDecoration(
          image: DecorationImage(
        image: AssetImage("assets/start_img.png"),
      )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            alignment: Alignment.center,
            width: 50,
            height: 16,
            decoration: const BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.all(Radius.circular(25))),
            child: SmoothPageIndicator(
              controller: PageController(),
              count: 3,
              effect: const WormEffect(
                activeDotColor: Colors.white,
                dotHeight: 6,
                dotWidth: 6,
                type: WormType.thinUnderground,
              ),
            ),
          ),
          const ListTile(
            titleTextStyle: TextStyle(color: Color(0xffB8B8B8), fontSize: 10),
            subtitleTextStyle: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
            title: Text("DJI • Jul 10, 2023"),
            subtitle: Text("A month with DJI Mini 3 Pro"),
            trailing: Icon(
              Icons.arrow_outward_rounded,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
