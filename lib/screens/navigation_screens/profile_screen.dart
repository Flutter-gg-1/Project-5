import 'package:blog_app/screens/edit_post_screen.dart';
import 'package:blog_app/screens/login_screen.dart';
import 'package:blog_app/screens/news_screen.dart';
import 'package:blog_app/services/extensions/screen.dart';
import 'package:blog_app/widgets/custom_blog_tile.dart';
import 'package:flutter/material.dart';
import '../../data/blog_data.dart';
import '../../models/user.dart';
import '../../services/setup.dart';
import '../../styles/colours.dart';

class ProfileScreen extends StatefulWidget {
  final User? user;
  const ProfileScreen({super.key, this.user});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 50),
      child: SingleChildScrollView(
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
            const SizedBox(
              height: 28,
            ),
            if (widget.user != null)
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
                      const SizedBox(
                        width: 12,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.user!.username,
                            style: const TextStyle(
                                fontSize: 14, color: Colours.textSecondary),
                          ),
                          Text(widget.user!.position,
                              style: const TextStyle(
                                  fontSize: 10, color: Colours.textSecondary))
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  if (widget.user!.posts.isNotEmpty)
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
                        const SizedBox(
                          height: 8,
                        ),
                        ...List.generate(widget.user!.posts.length, (index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colours.surfaceTertiary),
                                child: CustomBlogTile(
                                    user: widget.user!,
                                    index: index,
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => NewsScreen(
                                                user: widget.user,
                                                  post: widget.user!
                                                      .posts[index]))).then(
                                          (value) {
                                        if (value == true) {
                                          setState(() {});
                                        }
                                      });
                                    },
                                    onEdit: () {
                                      Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      EditPostScreen(
                                                        user: widget.user!,
                                                          post: widget.user!
                                                              .posts[index])))
                                          .then((value) {
                                        if (value == true) {
                                          setState(() {});
                                        }
                                      });
                                    },
                                    onDelete: () {
                                      locator.get<BlogData>().deletePost(
                                          post: widget.user!.posts[index],
                                          user: widget.user!);
                                      setState(() {});
                                    })),
                          );
                        }),
                      ],
                    )
                  else
                    const Text(
                      'No Blogs',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colours.textPrimary),
                    ),
                  const SizedBox(
                    height: 250,
                  ),
                  Center(
                    child: SizedBox(
                      height: context.getHeight() / 16.25,
                      width: context.getWidth() / 1.46,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white),
                          onPressed: () {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginScreen()),
                              (route) => false,
                            );
                          },
                          child: const Text(
                            'Logout',
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w900,
                                color: Colours.accentRed),
                          )),
                    ),
                  )
                ],
              )
            else
              Center(
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
                            onPressed: () {
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginScreen()),
                                (route) => false,
                              );
                            },
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
              )
          ],
        ),
      ),
    );
  }
}
