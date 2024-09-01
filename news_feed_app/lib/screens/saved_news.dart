import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:news_feed_app/data/models/profile_data_model.dart';
import 'package:news_feed_app/data/post_data.dart';
import 'package:news_feed_app/widgets/post_card.dart';

class SavedNews extends StatefulWidget {
  const SavedNews({super.key});

  @override
  State<SavedNews> createState() => _SavedNewsState();
}

class _SavedNewsState extends State<SavedNews> {
  void reBuild() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final userModel = GetIt.I.get<UserModel>(); 
    final postData = GetIt.I.get<PostData>(); 
    return Scaffold(
      backgroundColor: const Color(0xff111111),
      appBar: AppBar(
        backgroundColor: const Color(0xff1E1E1E),
        title: Container(
          alignment: Alignment.centerLeft,
          child: const Text(
            'Saved News',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: Color(0xffffffff)),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: [
            // Display all saved posts
            Column(
              children: postData.postsList
                  .where((post) => userModel.isFavorite(post.id)) // Check if the post is saved
                  .map((e) => Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: StoryCard(
                          id: e.id,
                          title: e.title,
                          username: e.author,
                          imgPath: e.image,
                          dateAndTime: e.minutes,
                        ),
                      ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}