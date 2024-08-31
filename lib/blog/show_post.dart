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
          crossAxisAlignment: CrossAxisAlignment.center,
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
          ],
        ),
      ),
    );
  }
}
