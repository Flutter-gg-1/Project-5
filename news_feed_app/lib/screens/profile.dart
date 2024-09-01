import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:news_feed_app/data/post_data.dart';
import 'package:news_feed_app/widgets/profile_story_card.dart'; 

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

    
  void deletePost(int id) {
    GetIt.I.get<PostData>().deletePost(id);
    reBuild(); 
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
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: const BoxDecoration(
                    color: Color(0xffffffff),
                    borderRadius: BorderRadius.all(Radius.circular(4))
                  ),
                   child: Image.asset('assets/images/person.png', fit: BoxFit.cover),
                ),
                SizedBox(width: 20,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                'Kyle Barr',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color(0xffB8B8B8),
                ),
              ),
              Text(
                'Software developer',
                style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  color: Color(0xffB8B8B8),
                ),
              ),
                  ],
                )
              ],
            ),
          ),
          Text(
            'Account',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: Color(0xffffffff)),
          ),
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