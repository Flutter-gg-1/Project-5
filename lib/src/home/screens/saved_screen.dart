import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:project_5/src/data_layer/post_data.dart';
import 'package:project_5/src/widget/story_item.dart';

class SavedScreen extends StatelessWidget {
  var posts = GetIt.I<PostData>().allPost;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //
      body: Column(
        children: [
          ...posts.map((post) {
            return StoryItem(
              username: post.username ?? 'Unknown Author',
              title: post.title ?? 'No Title',
              date: post.creationDate.toString(),
              // '$formattedDate • ${post.readingMinutes ?? 'Unknown Duration'} min read',
              image: post.image ?? 'assets/watch.png',
              index: posts.indexOf(post),
            );
          })
        ],
      ),
      backgroundColor: Colors.black,
    );
  }
}
