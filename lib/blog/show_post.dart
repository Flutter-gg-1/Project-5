import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../core/all_file.dart';

class ShowPost extends StatelessWidget {
  const ShowPost({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.primaryColor,
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: context.getHeightScreen(height: 0.06)),
            AppBarContainer(
              color: MyColors.primaryColor,
              color2: MyColors.primaryColor,
              icon: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back_ios,
                      color: MyColors.whiteTextColor)),
              icon2: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.bookmark_border,
                      color: MyColors.whiteTextColor)),
              icon3: IconButton(
                  onPressed: () {},
                  icon: const Icon(FontAwesomeIcons.pen,
                      color: MyColors.whiteTextColor)),
              child: const Text(''),
            ),
            SizedBox(height: context.getHeightScreen(height: 0.01)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: MyContainer(
                height: context.getHeightScreen(height: 0.2),
                child: Image.asset('assets/1.png', fit: BoxFit.cover),
              ),
            ),
            SizedBox(height: context.getHeightScreen(height: 0.01)),
            const Text('category',
                style: TextStyle(color: MyColors.whiteTextColor)),
            SizedBox(height: context.getHeightScreen(height: 0.01)),
            const Text('title',
                style: TextStyle(color: MyColors.whiteTextColor)),
            SizedBox(height: context.getHeightScreen(height: 0.01)),
            const CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage(
                  'https://cdn-icons-png.flaticon.com/512/3135/3135715.png'),
              backgroundColor: MyColors.primaryColor,
            ),
            SizedBox(height: context.getHeightScreen(height: 0.01)),
            const Text('Author',
                style: TextStyle(color: MyColors.whiteTextColor)),
            SizedBox(height: context.getHeightScreen(height: 0.01)),
            const Text('Published At',
                style: TextStyle(color: MyColors.whiteTextColor)),
            SizedBox(height: context.getHeightScreen(height: 0.01)),
            Row(
              children: [
                const Icon(FontAwesomeIcons.facebook,
                    color: MyColors.whiteTextColor),
                SizedBox(width: context.getWidthScreen(width: 0.02)),
                const Icon(FontAwesomeIcons.twitter,
                    color: MyColors.whiteTextColor),
                SizedBox(width: context.getWidthScreen(width: 0.02)),
                const Icon(FontAwesomeIcons.share,
                    color: MyColors.whiteTextColor),
              ],
            )
          ],
        ),
      ),
    );
  }
}
