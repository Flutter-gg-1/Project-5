import 'package:flutter/material.dart';
import 'package:news_feed_app/widgets/post_card.dart';

class SavedNews extends StatelessWidget {
  const SavedNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff111111),
      appBar: AppBar(
        backgroundColor: const Color(0xff111111),
        title: Container(
          alignment: Alignment.centerLeft, // Align the title to the left
          child: const Text(
            'Saved News',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: Color(0xffffffff)),
          ),
        ),
      ),
      body:  ListView(
        children:  const [
          SizedBox(height: 30,),
          // const Text(
          //         'Search for a news',
          //         style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400, color: Color(0xffB8B8B8)),
          //         maxLines: 2, 
          //         overflow: TextOverflow.ellipsis, 
          //       ),
                  //StoryCard( title: 'Now Google’s Bard AI can talk & respond to visual prompts', username: 'Kyle Barr', imgPath: 'assets/images/google.png', dateAndTime: 'Jul 13, 2023 • 2 min read', ),
        ],
      ),
    );
  }
}