import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:project5/data/all_posts.dart';
import 'package:project5/data/all_users.dart';
import 'package:project5/extensions/screen_push.dart';
import 'package:project5/models/post.dart';
import 'package:project5/models/user.dart';
import 'package:project5/screens/edit_post_screen.dart';
import 'package:project5/screens/view_post_screen.dart';
import 'package:project5/widgets/buttons/profile_button.dart';
import 'package:project5/widgets/cards/profile_card.dart';
import 'package:project5/widgets/guest_profile.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
              const Text(
                "Account",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Colors.white
                ),
              ),
              const SizedBox(height: 28),
              user == null ? const GuestProfile()
              : Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ProfileCard(username: user!.username),
                    const SizedBox(height: 43),
                    const Text(
                      "My Blogs",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Colors.white
                      ),
                    ),
                    const SizedBox(height: 14),
                    Expanded(
                      child: ListView.builder(
                        itemCount: user!.userPosts.length,
                        itemBuilder: (context, index) {
                          Post post = user!.userPosts[index];
                          return Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  context.push(
                                    target: ViewPostScreen(
                                      post: post,
                                      onSave: () {
                                        User? user = GetIt.I.get<AllUsers>().currentUser;
                                        if(user!=null) {
                                          user.savedPosts.contains(post) ? GetIt.I.get<AllUsers>().removeFromUserSavedPosts(post: post)
                                          : GetIt.I.get<AllUsers>().addToUserSavedPosts(post: post);
                                          post.isSaved = !post.isSaved;
                                        }
                                        // post.isSaved ? GetIt.I.get<AllUsers>().removeFromUserSavedPosts(post: post)
                                        // : GetIt.I.get<AllUsers>().addToUserSavedPosts(post: post);
                                        // post.isSaved = !post.isSaved;
                                        GetIt.I.get<AllUsers>().refreshSaved();
                                        GetIt.I.get<AllPosts>().refreshPosts();
                                        setState(() {});
                                      },
                                    ),
                                    saveData: (p0) {
                                      if (p0 == true) {
                                        setState(() {});
                                      }
                                    },
                                  );
                                },
                                child: Container(
                                  height: 111,
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: const Color(0xff1e1e1e),
                                    borderRadius: BorderRadius.circular(8)
                                  ), 
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        crossAxisAlignment:CrossAxisAlignment.center,
                                        children: [
                                          post.postImage.contains('assets') ? Image.asset(post.postImage,width: 80,height: 62,fit: BoxFit.cover)
                                          : Image.file(File(post.postImage),width: 80,height: 62,fit: BoxFit.cover,),
                                          const SizedBox(width: 8),
                                          SizedBox(
                                            width: 239,
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(
                                                  post.authorName,
                                                  style: const TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w500,
                                                    color: Color(0xffb8b8b8)
                                                  ),
                                                ),
                                                Text(
                                                  post.title,
                                                  style: const TextStyle(
                                                    letterSpacing: -0.41,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w600,
                                                    color: Color(0xffe8e8e8)
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ), 
                                      const SizedBox(height: 8),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                post.date,
                                                style: const TextStyle(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w500,
                                                  color: Color(0xff888888)
                                                ),
                                              ),
                                              Text(
                                                "• ${post.minutesToRead} min read",
                                                style: const TextStyle(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w500,
                                                  color: Color(0xff888888)
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  TextEditingController editTitle = TextEditingController(text: post.title);
                                                  TextEditingController editSummary = TextEditingController(text: post.summary);
                                                  TextEditingController editContent = TextEditingController(text: post.content);
                                                  context.push(
                                                    target: EditPostScreen(
                                                      post: post,
                                                      newTitleController: editTitle,
                                                      newSummaryController: editSummary,
                                                      newContentController: editContent,
                                                    ),
                                                    saveData: (p0) {
                                                      if (p0 == true) {
                                                        GetIt.I.get<AllPosts>().editPost(
                                                          post: post,
                                                          newTitle: editTitle.text,
                                                          newSummary:editSummary.text,
                                                          newContent:editContent.text
                                                        );
                                                        setState(() {});
                                                      }
                                                    },
                                                  );
                                                },
                                                child: const Icon(Icons.edit_outlined,color: Colors.white)
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  GetIt.I.get<AllPosts>().deletePost(post: post);
                                                  setState(() {});
                                                },
                                                child: const Icon(Icons.delete_outline_outlined,color: Colors.red)
                                              ),
                                            ],
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: 12)
                            ],
                          );
                        }
                      ),
                    ),
                    const Center(child: ProfileButton(buttonName: 'Logout', buttonNameColor: Color(0xffdd403c),)),
                  ],
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}