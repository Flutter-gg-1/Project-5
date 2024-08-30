import 'package:blog_app/services/extensions/screen.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import '../models/post.dart';
import '../styles/colours.dart';

class NewsScreen extends StatelessWidget {
  final Post post;
  const NewsScreen({super.key, required this.post});

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
          const Icon(
            Icons.bookmark_border_outlined,
            color: Colours.iconPrimary,
            size: 35,
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
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/images/1.png'))),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        post.category.toUpperCase(),
                        style: const TextStyle(
                            fontSize: 14, color: Colours.accentPurple),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        post.title,
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
                        post.author,
                        style: const TextStyle(
                            fontSize: 14, color: Colours.textSecondary),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        '${post.readingMinutes} min read - ${post.dateCreated}',
                        style: const TextStyle(
                            fontSize: 12, color: Colours.textTertiary),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Row(
                        children: [
                          Icon(FontAwesome.facebook_f_brand, color:  Colours.iconTertiary,),
                          SizedBox(width: 17,),
                          Icon(FontAwesome.twitter_brand, color:  Colours.iconTertiary,),
                          SizedBox(width: 17,),
                          Icon(FontAwesome.link_solid, color:  Colours.iconTertiary,),
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
                        post.summary,
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
                        post.content,
                        style: const TextStyle(
                            fontSize: 14, color: Colours.textSecondary),
                      ),
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
