import 'package:flutter/material.dart';
import '../core/all_file.dart';

class NewPost extends StatelessWidget {
  const NewPost({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.primaryColor,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.arrow_back_ios,
                size: 20, color: MyColors.whiteTextColor)),
        backgroundColor: MyColors.primaryColor,
        actions: const [
          Text(
            'Post',
            style: TextStyle(color: MyColors.whiteTextColor),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          color: MyColors.primaryColor,
          child: Column(
            children: [
              SizedBox(height: context.getHeightScreen(height: 0.1)),
              MyContainer(
                height: context.getWidthScreen(width: 0.4),
                width: context.getWidthScreen(width: 0.9),
                child:
                    IconButton(onPressed: () {}, icon: const Icon(Icons.close)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
