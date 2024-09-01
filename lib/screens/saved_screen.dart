import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:project5/data/all_posts.dart';
import 'package:project5/data/all_users.dart';
import 'package:project5/extensions/screen_push.dart';
import 'package:project5/models/post.dart';
import 'package:project5/models/user.dart';
import 'package:project5/screens/view_post_screen.dart';
import 'package:project5/widgets/cards/post_card.dart';
import 'package:project5/widgets/no_results_found.dart';

class SavedScreen extends StatefulWidget {
  const SavedScreen({super.key});

  @override
  State<SavedScreen> createState() => _SavedScreenState();
}

class _SavedScreenState extends State<SavedScreen> {

  User? user = GetIt.I.get<AllUsers>().currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff111111),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(23),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Saved News", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: Colors.white),),
              const SizedBox(height: 28),
              user==null || user!.savedPosts.isEmpty
              ? const NoResultsFound(message: "No news found")
              : Expanded(
                child: ListView.builder(
                  itemCount: user!.savedPosts.length,
                  itemBuilder: (context, index) {
                    Post post = user!.savedPosts[index];
                    return Column(
                      children: [
                        PostCard(
                          post: post,
                          onTap: (){
                            context.push(
                              target: ViewPostScreen(post: post),
                              saveData: (p0) {
                                if(p0==true){
                                  setState(() {});
                                }
                              },
                            );
                          },
                          onSave: () {
                            User? user = GetIt.I.get<AllUsers>().currentUser;
                            if(user!=null) {
                              user.savedPosts.contains(post) ? GetIt.I.get<AllUsers>().removeFromUserSavedPosts(post: post)
                              : GetIt.I.get<AllUsers>().addToUserSavedPosts(post: post);
                              post.isSaved = !post.isSaved;
                            }
                            // GetIt.I.get<AllPosts>().refreshPosts();
                            // GetIt.I.get<AllUsers>().refreshSaved();
                            // post.isSaved = false;
                            // GetIt.I.get<AllUsers>().removeFromUserSavedPosts(post: post);
                            setState(() {});
                          },
                        ),
                        const SizedBox(height: 12)
                      ],
                    );
                  }
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}