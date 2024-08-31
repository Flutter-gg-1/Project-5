import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:project5/data/all_posts.dart';
import 'package:project5/data/all_users.dart';
import 'package:project5/extensions/screen_push.dart';
import 'package:project5/models/post.dart';
import 'package:project5/models/user.dart';
import 'package:project5/screens/edit_post_screen.dart';
import 'package:project5/screens/login_screen.dart';
import 'package:project5/screens/view_post_screen.dart';

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
              const Text("Account",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700,color: Colors.white),),
              const SizedBox(height: 28),
              user == null ?
              Column(
                children: [
                  SizedBox(height: 190,),
                    Center(
                      child: Container(
                        alignment: Alignment.center,
                        width: 337,
                        height: 191,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Color(0xff1e1e1e)
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("You are not logged in yet",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w700,color: Colors.white),),
                            SizedBox(height: 47),
                            SizedBox(
                              width: 255,
                              height: 50,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius:BorderRadius.circular(5))),
                                  backgroundColor: WidgetStatePropertyAll(Colors.white),
                                ),
                                onPressed: () => Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return LoginScreen();
                                      }
                                    ),
                                    (predicate) => false
                                  ),
                                child: Text("Login",style: TextStyle(fontSize: 24,fontWeight: FontWeight.w800,color: Color(0xffbda6f5)),)
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              : ListTile(
                leading: Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: Colors.white),
                  padding: const EdgeInsets.all(9),
                  child: Image.asset('assets/avatar.png', width: 35,)
                ),
                title: Text(user!.username),
                titleTextStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Color(0xffb8b8b8)),
                subtitle: Text('Software developer'),
                subtitleTextStyle: const TextStyle(fontSize: 10, fontWeight: FontWeight.w500, color: Color(0xffb8b8b8)),
              ),
              SizedBox(height: 43,),
              Text("My Blogs", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.white),),
              SizedBox(height: 14,),
              Expanded(
                child: ListView.builder(
                  itemCount: user!.userPosts.length,
                  itemBuilder: (context, index) {
                    Post post = user!.userPosts[index];
                    return InkWell(
                      onTap: (){
                        context.push(
                          target: ViewPostScreen(
                            post: post,
                            onSave: () {
                              post.isSaved ?
                              GetIt.I.get<AllPosts>().removeFromUserSavedPosts(post: post)
                              : GetIt.I.get<AllPosts>().addToUserSavedPosts(post: post);
                              post.isSaved = !post.isSaved;
                              setState(() {});
                            },
                          ),
                          saveData: (p0) {
                            if(p0==true){
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
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                post.postImage.contains('assets') ?
                                  Image.asset(post.postImage, width: 80, height: 62,fit: BoxFit.cover)
                                  : Image.file(File(post.postImage), width: 80, height: 62,fit: BoxFit.cover,),
                                const SizedBox(width: 8),
                                SizedBox(
                                  width: 239,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(post.authorName,style: const TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: Color(0xffb8b8b8)),),
                                      Text(post.title,style: const TextStyle(letterSpacing: -0.41,fontSize: 16,fontWeight: FontWeight.w600,color: Color(0xffe8e8e8)),),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(height: 8,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    Text(post.date,style: const TextStyle(fontSize: 10,fontWeight: FontWeight.w500,color: Color(0xff888888)),),
                                    Text("• ${post.minutesToRead} min read",style: const TextStyle(fontSize: 10,fontWeight: FontWeight.w500,color: Color(0xff888888)),),
                                  ],
                                ),
                                Row(
                                  children: [
                                    InkWell(
                                      onTap: (){
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
                                            if(p0==true) {
                                              GetIt.I.get<AllPosts>().editPost(
                                                post:post,
                                                newTitle : editTitle.text,
                                                newSummary : editSummary.text,
                                                newContent : editContent.text
                                              );
                                              setState(() {});
                                            }
                                          },
                                        );
                                      },
                                      child: Icon(Icons.edit_outlined, color: Colors.white,)
                                    ),
                                    InkWell(
                                      onTap: (){},
                                      child: Icon(Icons.delete_outline_outlined, color: Colors.red,)
                                    ),
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
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