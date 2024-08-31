import 'package:blog_app/services/extensions/screen.dart';
import 'package:blog_app/widgets/custom_blog_tile.dart';
import 'package:flutter/material.dart';
import '../../models/user.dart';
import '../../styles/colours.dart';

class ProfileScreen extends StatelessWidget {
  final User? user;
  const ProfileScreen({super.key, this.user});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Account',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colours.textPrimary),
            ),
            if (user != null)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 56,
                        width: 56,
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5)),
                        child: Image.asset(
                          'assets/images/pfp.png',
                          height: 40,
                          width: 40,
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            user!.username,
                            style: const TextStyle(
                                fontSize: 14, color: Colours.textSecondary),
                          ),
                          Text(user!.position,
                              style: const TextStyle(
                                  fontSize: 10, color: Colours.textSecondary))
                        ],
                      )
                    ],
                  ),
                  if (user!.posts.isNotEmpty)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'My Blogs',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colours.textPrimary),
                        ),
                        ...List.generate(user!.posts.length, (index) {
                          return CustomBlogTile(user: user!, index: index);
                        }),
                      ],
                    )
                  else
                    const Text('No Blogs'),
                  SizedBox(
                    height: context.getHeight() / 16.25,
                    width: context.getWidth() / 1.46,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white),
                        onPressed: () {},
                        child: const Text(
                          'Logout',
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w900,
                              color: Colours.accentRed),
                        )),
                  )
                ],
              )
            else
              Expanded(
                child: Center(
                  child: Container(
                    height: context.getHeight() / 4.25,
                    width: context.getWidth() / 1.113,
                    decoration: BoxDecoration(
                        color: const Color(0xff1E1E1E),
                        borderRadius: BorderRadius.circular(8)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text(
                          'You are not logged in yet',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colours.textPrimary),
                        ),
                        SizedBox(
                          height: context.getHeight() / 16.25,
                          width: context.getWidth() / 1.46,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white),
                              onPressed: () {},
                              child: const Text(
                                'Login',
                                style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w900,
                                    color: Colours.accentPurple),
                              )),
                        )
                      ],
                    ),
                  ),
                ),
              )
          ],
        ),
      );
  }
}
