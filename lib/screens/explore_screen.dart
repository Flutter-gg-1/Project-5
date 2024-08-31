import 'package:blog_app_project/helper/extensions/screen.dart';
import 'package:flutter/material.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff111111),
      body: Column(
        children: [
          const SizedBox(
            height: 70,
          ),
          Container(
              height: context.getHeight() / 20,
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: const TextField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Search for News',
                  hintStyle: TextStyle(color: Color(0xffB8B8B8)),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  border: InputBorder.none,
                ),
              )),
          const Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Search for a news',
                  style: TextStyle(color: Color(0xffB8B8B8)),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
