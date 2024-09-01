import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:news_feed_app/post_data.dart';
import 'package:news_feed_app/widgets/profile_story_card.dart'; // Ensure the correct import

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

    
  void deletePost(int id) {
    GetIt.I.get<PostData>().deletePost(id);
    reBuild(); // Rebuild the Profile widget after deletion
  }
      reBuild() {
      setState(() {});
    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff111111),
      appBar: AppBar(
        backgroundColor: const Color(0xff111111),
        title: Container(
          alignment: Alignment.centerLeft, // Align the title to the left
          child: const Text(
            'Account',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: Color(0xffffffff)),
          ),
        ),
      ),
      body: ListView(
        children: [
          const SizedBox(height: 30),
          Column(
           children: GetIt.I.get<PostData>().postsList
                .map((e) => Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: ProfileStoryCard(
                        id: e.id,
                        title: e.title,
                        imgPath: e.image,
                        onEdit: reBuild, 
                        onDelete: () => deletePost(e.id), //
                      ),
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }
}