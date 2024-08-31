import 'dart:io';
import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project5/data/all_posts.dart';
import 'package:project5/data/all_users.dart';
import 'package:project5/models/post.dart';
import 'package:project5/widgets/alert_dialogs/error_alert_dialog.dart';
import 'package:project5/widgets/text_fields/add_post_text_field.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({super.key});

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {

  late Widget previewImage;
  String? postImage;
  TextEditingController titleController = TextEditingController();
  TextEditingController summaryController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  TextEditingController readingMinutesController = TextEditingController();
  String selectedCategory = '';

  @override
  void initState() {
    super.initState();
    previewImage = Container(
      width: 337,
      height: 140,
      alignment: Alignment.center,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: Colors.white.withOpacity(0.12)),
      child: Icon(Icons.add_rounded, size: 70, color: Colors.white.withOpacity(0.5),),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff111111),
      appBar: AppBar(
        backgroundColor: const Color(0xff111111),
        foregroundColor: Colors.white,
        leading: IconButton(onPressed: ()=>Navigator.pop(context), icon: const Icon(Icons.arrow_back_ios)),
        actions: [
          TextButton(
            onPressed: (){
              if(titleController.text.isNotEmpty && summaryController.text.isNotEmpty && contentController.text.isNotEmpty && selectedCategory.isNotEmpty && readingMinutesController.text.isNotEmpty) {
                Post post = Post(
                  category: selectedCategory,
                  postImage: postImage == null ? 'assets/placeholder.png' : postImage!,
                  authorName: GetIt.I.get<AllUsers>().currentUser!.username,
                  title: titleController.text,
                  summary: summaryController.text,
                  content: contentController.text,
                  date: DateTime.now().toString(),
                  minutesToRead: int.parse(readingMinutesController.text),
                  isSaved: false
                );
                GetIt.I.get<AllPosts>().addPost(post: post);
                GetIt.I.get<AllUsers>().currentUser!.userPosts.add(post);
                Navigator.pop(context,true);
              }
              else {
                showDialog(
                  context: context,
                  builder: (context)=> const ErrorAlertDialog(message: 'Some required fields are not filled'),
                );
              }
            },
            child: const Text(
              "Post",
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w700,
                color: Colors.white
              )
            )
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(17),
        child: ListView(
          children: [
            const Text("Image", style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700, color: Colors.white),),
            const SizedBox(height: 7),
            InkWell(
              splashColor: Colors.transparent,
              onTap: () async {
                final newImg = await ImagePicker().pickImage(source: ImageSource.gallery);
                if (newImg == null) {
                  return;
                }
                postImage = newImg.path;
                previewImage = Image.file(File(postImage!), width: 337, height: 140, fit: BoxFit.cover,);
                setState(() {});
              },
              child: previewImage
            ),
            const SizedBox(height: 32),
            AddPostTextField(
              inputName: 'Title',
              inputHint : 'Enter your blog title',
              controller : titleController,
              maxLines: 2
            ),
            const SizedBox(height: 32),
            AddPostTextField(
              inputName: 'Summary',
              inputHint : 'Give a brief summary about your blog',
              controller : summaryController,
              minLines: 3
            ),
            const SizedBox(height: 32,),
            AddPostTextField(
              inputName: 'Content',
              inputHint : 'Write your blog here',
              controller : contentController,
              minLines: 7
            ),
            const SizedBox(height: 32),
            const Text("Category", style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700, color: Colors.white),),
            const SizedBox(height: 7),
            CustomRadioButton(
              selectedBorderColor: Colors.transparent,
              unSelectedBorderColor: Colors.transparent,
              selectedColor: Colors.white, // bg color
              unSelectedColor: const Color(0xff595959), // bg color
              buttonLables: GetIt.I.get<AllPosts>().categories,
              buttonValues: GetIt.I.get<AllPosts>().categories,
              shapeRadius: 2,
              enableShape: true,
              elevation: 0,
              autoWidth: true,
              height: 26,
              buttonTextStyle: const ButtonTextStyle(
                selectedColor: Color(0xffA48BE2),
                unSelectedColor: Color(0xff2c2c2c),
                textStyle: TextStyle(fontSize: 16)
              ),
              radioButtonValue: (value) => selectedCategory = value,
            ),
            const SizedBox(height: 32),
            AddPostTextField(
              inputName: 'Reading minutes',
              inputHint : 'Minutes of reading this blog',
              controller : readingMinutesController,
              maxLines: 2
            ),
          ],
        ),
      ),
    );
  }
}