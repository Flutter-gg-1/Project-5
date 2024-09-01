import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:project_5/src/data_layer/post_data.dart';
import 'package:project_5/src/home/add_post_.dart';
import 'package:project_5/src/widget/story_item.dart';
import 'package:project_5/src/widget/upper_post.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Access the list of posts using GetIt
    var posts = GetIt.I<PostData>().allPost;

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        IconButton(
          alignment: Alignment.topRight,
          iconSize: 30,
          icon: const Icon(Icons.add),
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => AddPost()));
          },
        ),
        // Carousel Slider displaying UpperPosts widgets
        CarouselSlider(
          options: CarouselOptions(height: 200.0),
          items: [1, 2].map((i) {
            return UpperPosts(count: i);
          }).toList(),
        ),
        const SizedBox(height: 20),
        const Text(
          'Top Stories',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),

        // Display StoryItems for each post using .map()
        ...posts.map((post) {
          return StoryItem(
            username: post.username ?? 'Unknown auther',
            title: post.title ?? 'No Title',
            date: post.creationDate.toString(),
            // '$formattedDate • ${post.readingMinutes ?? 'Unknown Duration'} min read',
            image: post.image ?? 'assets/watch.png',
            index: posts.indexOf(post),
          );
        })
      ],
    );
  }
}

