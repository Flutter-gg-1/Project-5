import 'package:blog_app/data/blog_data.dart';
import 'package:blog_app/screens/news_screen.dart';
import 'package:blog_app/services/setup.dart';
import 'package:flutter/material.dart';
import '../models/post.dart';
import '../models/user.dart';
import '../styles/colours.dart';

class CustomPostTile extends StatefulWidget {
  final Post post;
  final User? user;
  const CustomPostTile({super.key, required this.post, required this.user});

  @override
  State<CustomPostTile> createState() => _CustomPostTileState();
}

class _CustomPostTileState extends State<CustomPostTile> {
  late bool isBookmarked;

  @override
  void initState() {
    isBookmarked =
        widget.user != null && widget.user!.saved.contains(widget.post);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => NewsScreen(
                  user: widget.user,
                  post: widget.post)));
      },
      tileColor: Colours.surfaceTertiary,
      title: Column(
        children: [
          Row(
            children: [
              Container(
                height: 62,
                width: 80,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image:  DecorationImage(
                        image: AssetImage(widget.post.image ?? 'assets/images/default.png'),
                        fit: BoxFit.contain)),
              ),
              const SizedBox(
                width: 8,
              ),
              SizedBox(
                width: 240,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.post.author,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colours.textSecondary,
                        )),
                    Text(widget.post.title,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colours.iconSecondary,
                        )),
                  ],
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text('${widget.post.dateCreated} - ',
                      style: const TextStyle(
                        fontSize: 10,
                        color: Colours.textTertiary,
                      )),
                  Text('${widget.post.readingMinutes} min read',
                      style: const TextStyle(
                        fontSize: 10,
                        color: Colours.textTertiary,
                      )),
                ],
              ),
              Row(
                children: [
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
                        isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                        color: isBookmarked
                            ? Colours.iconPrimary
                            : Colours.textTertiary,
                      )),
                  InkWell(
                      onTap: () {},
                      child: const Icon(
                        Icons.more_vert_rounded,
                        color: Colours.textTertiary,
                      )),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
