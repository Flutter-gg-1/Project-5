import 'dart:io';
import 'dart:math';

import 'package:blog_app/data/post_data.dart';
import 'package:blog_app/data/user_data.dart';
import 'package:blog_app/models/post_model.dart';
import 'package:blog_app/widgets/fields/info_feild.dart';
import 'package:blog_app/widgets/buttons/selectable_box.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  File? selectedImage;
  final picker = ImagePicker();

  //Image Picker function to get image from gallery
  Future getImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        selectedImage = File(pickedFile.path);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    TextEditingController sumController = TextEditingController();
    TextEditingController contentController = TextEditingController();
    TextEditingController minController = TextEditingController();
    String catValue = "";

    return Scaffold(
      backgroundColor: const Color(0xff111111),
      appBar: AppBar(
        backgroundColor: const Color(0xff111111),
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
            )),
        actions: [
          TextButton(
              onPressed: () {
                GetIt.I.get<PostData>().addPost(
                    newPost: PostModel(
                        userAvatar:
                            GetIt.I.get<UserData>().users.first.avatar ??
                                "assets/avatar_holder.png",
                        image: selectedImage?.path ?? "assets/img_holder.png",
                        id: Random().nextInt(9999).toString(),
                        title: titleController.text,
                        summary: sumController.text,
                        content: contentController.text,
                        category: catValue,
                        minutes: minController.text,
                        date: DateFormat.yMMMd()
                            .format(DateTime.now())
                            .toString(),
                        auther: GetIt.I.get<UserData>().users.first.userName));
                Navigator.pop(context, true);
              },
              child: const Text(
                "Post",
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Image",
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              const SizedBox(height: 10),
              InkWell(
                  child: Container(
                    alignment: Alignment.center,
                    width: 337,
                    height: 140,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: selectedImage == null
                                ? const AssetImage("assets/add 1.png")
                                : FileImage(File(selectedImage!.path))),
                        color: const Color.fromARGB(255, 60, 60, 60),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  onTap: () {
                    getImageFromGallery();
                  }),
              const SizedBox(height: 20),
              InfoFeild(
                  title: "Title",
                  hint: "Enter your blog title",
                  controller: titleController),
              const SizedBox(height: 20),
              InfoFeild(
                title: "Summary",
                hint: "Enter your blog Summary",
                minLines: 3,
                controller: sumController,
              ),
              const SizedBox(height: 20),
              InfoFeild(
                title: "Content",
                hint: "Enter your blog Content",
                minLines: 6,
                controller: contentController,
              ),
              const SizedBox(height: 20),
              const Row(
                children: [
                  Text(
                    "Category",
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  SizedBox(width: 3),
                  Text("*", style: TextStyle(color: Colors.red)),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SelectableBox(
                    category: 'TECHNOLOGY',
                    onTap: () {
                      catValue = "TECHNOLOGY";
                    },
                  ),
                  const SizedBox(width: 5),
                  SelectableBox(
                    category: 'AI',
                    onTap: () {
                      catValue = "AI";
                    },
                  ),
                  const SizedBox(width: 5),
                  SelectableBox(
                    category: 'CLOUD',
                    onTap: () {
                      catValue = "CLOUD";
                    },
                  ),
                  const SizedBox(width: 5),
                  SelectableBox(
                    category: 'ROBOTIC',
                    onTap: () {
                      catValue = "ROBOTIC";
                    },
                  ),
                  const SizedBox(width: 5),
                  SelectableBox(
                    category: 'IOT',
                    onTap: () {
                      catValue = "IOT";
                    },
                  )
                ],
              ),
              const SizedBox(height: 20),
              InfoFeild(
                title: "Reading minutes",
                hint: "Minutes of reading this blog",
                controller: minController,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
