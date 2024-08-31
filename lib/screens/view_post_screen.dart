import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:project5/data/all_posts.dart';
import 'package:project5/data/all_users.dart';
import 'package:project5/extensions/screen_push.dart';
import 'package:project5/models/post.dart';
import 'package:project5/models/user.dart';
import 'package:project5/screens/edit_post_screen.dart';

class ViewPostScreen extends StatefulWidget {
  final Post post;
  final Function()? onSave;
  const ViewPostScreen({super.key, required this.post, this.onSave});

  @override
  State<ViewPostScreen> createState() => _ViewPostScreenState();
}

class _ViewPostScreenState extends State<ViewPostScreen> {
  late bool updateHome;
  late TextEditingController newTitleController;
  late TextEditingController newSummaryController;
  late TextEditingController newContentController;
  User? user = GetIt.I.get<AllUsers>().currentUser;

  @override
  void initState(){
    super.initState();
    updateHome = false;
    newTitleController = TextEditingController(text: widget.post.title);
    newSummaryController = TextEditingController(text: widget.post.summary);
    newContentController = TextEditingController(text: widget.post.content);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff111111),
      appBar: AppBar(
        backgroundColor: const Color(0xff111111),
        foregroundColor: Colors.white,
        leading: IconButton(onPressed: ()=>Navigator.pop(context,updateHome), icon: const Icon(Icons.arrow_back_ios)),
        actions: [
          IconButton(
            icon: const Icon(Icons.format_size_outlined),
            onPressed: (){},
          ),
          IconButton(
            icon: widget.post.isSaved ? const Icon(Icons.bookmark) : const Icon(Icons.bookmark_border),
            onPressed: widget.onSave,
          ),
          user!=null ? IconButton(
            icon: const Icon(Icons.edit_outlined),
            onPressed: (){
              context.push(
                target: EditPostScreen(
                  post: widget.post,
                  newTitleController: newTitleController,
                  newSummaryController: newSummaryController,
                  newContentController: newContentController,
                ),
                saveData: (p0) {
                  if(p0==true) {
                    updateHome = true;
                    GetIt.I.get<AllPosts>().editPost(
                      post:widget.post,
                      newTitle : newTitleController.text,
                      newSummary : newSummaryController.text,
                      newContent : newContentController.text
                    );
                    setState(() {});
                  }
                },
              );
            },
          ) : const SizedBox()
        ],
      ),
      body: ListView(
        children: [
          widget.post.postImage.contains('assets') ?
          Image.asset(widget.post.postImage, width: 375, height: 266, fit: BoxFit.cover)
          : Image.file(File(widget.post.postImage), width: 375, height: 266, fit: BoxFit.cover),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.post.category, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Color(0xffBDA6F5))),
                const SizedBox(height: 8),
                Text(widget.post.title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: Colors.white),),
                const SizedBox(height: 8),
                const CircleAvatar(radius: 14,backgroundImage: AssetImage('assets/avatar.png'),),
                const SizedBox(height: 8),
                Text(widget.post.authorName, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Color(0xffb8b8b8)),),
                const SizedBox(height: 16),
                Text("${widget.post.minutesToRead} min read • ${widget.post.date}",style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Color(0xff888888)),),
                const SizedBox(height: 16),
                SizedBox(
                  width: 84,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset('assets/facebook.png', width: 20,height: 20),
                      Image.asset('assets/twitter.png', width: 20, height: 20,),
                      const Icon(Icons.link, size: 20, color: Color(0xffcfcfcf),),
                    ],
                  ),
                ),
                const SizedBox(height: 55,),
                const Text("Summary", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Color(0xffe8e8e8)),),
                const SizedBox(height: 14,),
                Text(widget.post.summary, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Color(0xffb8b8b8)),),
                const SizedBox(height: 28,),
                const Text("Content", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Color(0xffe8e8e8)),),
                const SizedBox(height: 14,),
                Text(widget.post.content, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Color(0xffb8b8b8)),),
              ],
            ),
          )
        ],
      ),
    );
  }
}