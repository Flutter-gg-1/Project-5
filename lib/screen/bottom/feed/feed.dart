import 'package:flutter/material.dart';
import '../../../core/all_file.dart';

class FeedScreen extends StatelessWidget {
  FeedScreen({super.key});
  final List<ArticleModel> articleList =
      getIt.get<ArticleDataServers>().articleData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.primaryColor,
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const AppBarContainer(),
                SizedBox(height: context.getHeightScreen(height: 0.02)),
                MyContainer(
                  width: context.getWidthScreen(width: 0.96),
                  height: context.getHeightScreen(height: 0.2),
                  child: const MyPageView(),
                ),
                SizedBox(height: context.getHeightScreen(height: 0.02)),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Top Stories',
                        style: TextStyle(color: MyColors.whiteTextColor)),
                    Text('See all',
                        style: TextStyle(color: MyColors.greyTextColor)),
                  ],
                ),
                SizedBox(height: context.getHeightScreen(height: 0.02)),
                ...List.generate(
                  articleList.length,
                  (index) => Column(
                    children: [
                      MyContainerBlogs(
                        topTitle: articleList[index].content,
                        title: articleList[index].title,
                        imagePath: articleList[index].imagePath,
                        publishedAt: articleList[index].publishedAt,
                      ),
                      SizedBox(height: context.getHeightScreen(height: 0.02)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
