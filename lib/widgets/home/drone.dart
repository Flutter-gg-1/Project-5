import 'package:flutter/material.dart';

class Drone extends StatelessWidget {
  const Drone({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset("assets/home/drone.png"),
        Positioned(
            bottom: 16,
            left: 16,
            child: Row(
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "DJI • Jul 10, 2023",
                      style: TextStyle(color: Color(0xffB8B8B8), fontSize: 12),
                    ),
                    Text(
                      "A month with DJI Mini 3 Pro",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 50,
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.arrow_outward,
                      color: Colors.white,
                      size: 24,
                    ))
              ],
            ))
      ],
    );
  }
}
