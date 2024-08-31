import 'package:blog_app/services/extensions/screen.dart';
import 'package:blog_app/services/setup.dart';
import 'package:blog_app/styles/colours.dart';
import 'package:flutter/material.dart';
import '../data/blog_data.dart';
import '../models/user.dart';
import 'custom_post_tile.dart';

class TabBody extends StatelessWidget {
  final User? user;
  final int tabIndex;
  const TabBody({super.key, required this.user,required this.tabIndex});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        Stack(
          children: [
            Center(
              child: Container(
                height: context.getHeight() / 4.5,
                width: context.getWidth() / 1.1,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                  'assets/images/2.png',
                ))),
              ),
            ),
            Positioned(
                left: context.getWidth() / 15,
                top: context.getHeight() / 6.3,
                child: const Text('DJI • Jul 10, 2023',
                    style:
                        TextStyle(fontSize: 10, color: Colours.textSecondary))),
            Positioned(
                left: context.getWidth() / 15,
                top: context.getHeight() / 5.7,
                child: const Text(
                  'A month with DJI Mini 3 Pro',
                  style: TextStyle(fontSize: 16, color: Colours.textPrimary),
                )),
            Positioned(
                top: context.getHeight() / 5.7,
                left: context.getWidth() - 90,
                child: const Icon(
                  Icons.arrow_outward_rounded,
                  color: Colours.textPrimary,
                )),
          ],
        ),
        const Divider(),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Top Stories',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colours.iconSecondary),
            ),
            Text(
              'See all',
              style: TextStyle(fontSize: 12, color: Colours.textTertiary),
            ),
          ],
        ),
        Column(
          children: List.generate(
            locator.get<BlogData>().posts.length,
            (index) {
              return Column(
                children: [
                  CustomPostTile(
                    post:  locator.get<BlogData>().posts[index],
                    user: user,
                  ),
                  const SizedBox(height: 12),
                ],
              );
            },
          ),
        ),
      ]),
    );
  }
}
