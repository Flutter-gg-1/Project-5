import 'package:blog_app/services/extensions/screen.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import '../data/blog_data.dart';
import '../models/post.dart';
import '../models/user.dart';
import '../services/setup.dart';
import '../styles/colours.dart';

class NewsScreen extends StatefulWidget {
  final Post post;
  final User? user;
  const NewsScreen({super.key, required this.post, required this.user});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  late bool isBookmarked;

  @override
  void initState() {
    isBookmarked =
        widget.user != null && widget.user!.saved.contains(widget.post);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(
          color: Colours.iconPrimary,
        ),
        actions: [
          const Icon(
            Icons.format_size_outlined,
            color: Colours.iconPrimary,
            size: 35,
          ),
          const SizedBox(
            width: 10,
          ),
          InkWell(
            onTap: () {
              if (widget.user != null) {
                setState(() {
                  isBookmarked = !isBookmarked;
                  if (isBookmarked) {
                    widget.user!.saved.add(widget.post);
                    locator.get<BlogData>().saveUser();
                  } else {
                    widget.user!.saved.remove(widget.post);
                    locator.get<BlogData>().saveUser();
                  }
                });
              } else {
                showDialog(
                    context: context,
                    builder: (context) {
                      return const AlertDialog(
                        content: Text(
                          'You must be logged in to save posts',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                    });
              }
            },
            child: Icon(
              isBookmarked ? Icons.bookmark : Icons.bookmark_border_outlined,
              color: Colours.iconPrimary,
              size: 35,
            ),
          ),
          const SizedBox(
            width: 15,
          )
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: context.getHeight() / 3.25,
                  width: context.getWidth(),
                  decoration:  BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(widget.post.image ?? 'assets/images/default.png'))),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Image.asset('assets/images/cat.png'),
                          SizedBox(width: 8,),
                          Text(
                            widget.post.category.toUpperCase(),
                            style: const TextStyle(
                                fontSize: 14, color: Colours.accentPurple, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        widget.post.title,
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colours.textPrimary),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const CircleAvatar(
                        radius: 28,
                        backgroundImage: AssetImage('assets/images/pfp.png'),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        widget.post.author,
                        style: const TextStyle(
                            fontSize: 14, color: Colours.textSecondary),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        '${widget.post.readingMinutes} min read - ${widget.post.dateCreated}',
                        style: const TextStyle(
                            fontSize: 12, color: Colours.textTertiary),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Row(
                        children: [
                          Icon(
                            FontAwesome.facebook_f_brand,
                            color: Colours.iconTertiary,
                          ),
                          SizedBox(
                            width: 17,
                          ),
                          Icon(
                            FontAwesome.twitter_brand,
                            color: Colours.iconTertiary,
                          ),
                          SizedBox(
                            width: 17,
                          ),
                          Icon(
                            FontAwesome.link_solid,
                            color: Colours.iconTertiary,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      const Text(
                        'Summary',
                        style: TextStyle(
                            fontSize: 16, color: Colours.iconSecondary),
                      ),
                      Text(
                        widget.post.summary,
                        style: const TextStyle(
                            fontSize: 14, color: Colours.textSecondary),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'Content',
                        style: TextStyle(
                            fontSize: 16, color: Colours.iconSecondary),
                      ),
                      Text(
                        widget.post.content,
                        style: const TextStyle(
                            fontSize: 14, color: Colours.textSecondary),
                      ),
                      const SizedBox(
                        height: 50,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Positioned(
            top: context.getHeight() / 1.165,
            child: Container(
              height: 40,
              width: context.getWidth(),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    const Color(0xff111111),
                    const Color(0xff111111).withOpacity(0.8),
                    const Color(0xff111111).withOpacity(0.0)
                  ],
                  stops: const [0, 0.44, 1],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
