import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; 
import 'package:news_feed_app/widgets/custom_textfeild.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff111111),
      appBar: AppBar(
        backgroundColor: const Color(0xff111111),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(30.0),
          child: TextContainer(title: '', hint: 'Search for News', showIcon: true),
        ),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center, 
          children: [
            SvgPicture.asset(
              'assets/svg/search.svg',
              color: const Color(0xffB8B8B8),
              height: 24,
              width: 24,
            ),
            const SizedBox(width: 8), 
            const Text(
                    'Search for a news',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400, color: Color(0xffB8B8B8)),
                    maxLines: 2, 
                    overflow: TextOverflow.ellipsis, 
                  ),
          ],
        ),
      ),
    );
  }
}