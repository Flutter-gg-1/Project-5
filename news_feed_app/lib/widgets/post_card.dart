import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:news_feed_app/data/models/profile_data_model.dart'; // Ensure this is the correct model
import 'package:news_feed_app/screens/blog.dart';

class StoryCard extends StatefulWidget {
  const StoryCard({
    super.key,
    required this.title,
    required this.username,
    required this.imgPath,
    required this.dateAndTime,
    required this.id, 
  });

  final String title;
  final String username;
  final String imgPath;
  final String dateAndTime;
  final int id; // Post ID

  @override
  _StoryCardState createState() => _StoryCardState();
}

class _StoryCardState extends State<StoryCard> {
  late bool isFavorite;

  @override
  void initState() {
    super.initState();
    final userModel = GetIt.I.get<UserModel>();
    // Check if the post is in the user's favorites
    isFavorite = userModel.isFavorite(widget.id);
  }

  void toggleFavorite() {
    final userModel = GetIt.I.get<UserModel>();
    if (isFavorite) {
      userModel.removeFavorite(widget.id);
    } else {
      userModel.addFavorite(widget.id);
    }
    setState(() {
      isFavorite = !isFavorite; // Update favorite status
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        color: Color(0xff1E1E1E),
      ),
      child: InkWell(
        onTap: () {
          // Pass the id to the BlogPage
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BlogPage(postId: widget.id), // Update with postId
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    clipBehavior: Clip.hardEdge,
                    width: 80,
                    height: 62,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      color: Color(0xffffffff),
                    ),
                    child: Image.asset(widget.imgPath, fit: BoxFit.cover),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.username,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff888888),
                          ),
                        ),
                        Text(
                          widget.title,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Color(0xffffffff),
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Row(
                  children: [
                    Text(
                      widget.dateAndTime,
                      style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff888888),
                      ),
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        IconButton(
                          onPressed: toggleFavorite,
                          icon: Icon(
                            isFavorite ? Icons.bookmark : Icons.bookmark_border,
                            color: const Color(0xff888888),
                          ),
                        ),
                        const Icon(Icons.more_vert, color: Color(0xff888888)),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}