import 'package:flutter/material.dart';
import 'package:project_5/components/text/text_custom.dart';

class PageviewCustom extends StatelessWidget {
  const PageviewCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset("assets/STK156_Instagram_threads_2 1.png"),
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                height: 4,
              ),
              TextCustom(
                  text: "DJI • Jul 10, 2023",
                  color: Color(0xffB8B8B8),
                  weight: FontWeight.w500,
                  fontSize: 10),
              TextCustom(
                  text: "A month with DJI Mini 3 Pro",
                  color: Colors.white,
                  weight: FontWeight.w700,
                  fontSize: 16)
            ],
          ),
        ),
        const Positioned(
            top: 135,
            left: 290,
            child: Icon(
              Icons.arrow_outward_sharp,
              color: Colors.white,
            )),
        Positioned(top: 10, left: 145, child: Image.asset("assets/Frame.png"))
      ],
    );
  }
}
