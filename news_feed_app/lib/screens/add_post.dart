import 'dart:io';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:group_button/group_button.dart';
import 'package:image_picker/image_picker.dart';
import 'package:news_feed_app/widgets/custom_textfeild.dart';

class AddPost extends StatefulWidget {
  const AddPost({super.key});

  @override
  State<AddPost> createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  final controllerCategoryList = GroupButtonController();
  File? selectedImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff111111),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: const Color.fromARGB(0, 33, 149, 243),
        actions: [
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(const Color(0xff111111)),
            ),
            onPressed: () {},
            child: const Text(
              'Post',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Color(0xffffffff)),
            ),
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            children: [
              const SizedBox(height: 30),
              const Text('Image', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Color(0xffffffff))),
              const SizedBox(height: 10),
              ImagePickerWidget(
                onImageSelected: (File image) {
                  setState(() {
                    selectedImage = image;
                  });
                },
                selectedImage: selectedImage, // Pass the selected image
              ),
              const SizedBox(height: 30),
              const TextContainer(title: 'Title', hint: 'Enter your blog title', titleSize: 16, titleWeight: FontWeight.w700, unlimittedLines: true),
              const SizedBox(height: 30),
              const TextContainer(title: 'Summary', hint: 'Give a brief summary about your blog', titleSize: 16, titleWeight: FontWeight.w700, unlimittedLines: true, feildlines: 2),
              const SizedBox(height: 30),
              const TextContainer(title: 'Content', hint: 'Write your blog here', titleSize: 16, titleWeight: FontWeight.w700, unlimittedLines: true, feildlines: 5),
              const SizedBox(height: 30),
              const Text('Category', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Color(0xffffffff))),
              const SizedBox(height: 10),
              CategoryList(controller: controllerCategoryList),
              const SizedBox(height: 30),
              const TextContainer(title: 'Reading minutes', hint: 'Minutes of reading this blog', titleSize: 16, titleWeight: FontWeight.w700, unlimittedLines: true),
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryList extends StatelessWidget {
  const CategoryList({super.key, required this.controller});
  final GroupButtonController controller;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          GroupButton(
            controller: controller,
            options: const GroupButtonOptions(
              borderRadius: BorderRadius.all(Radius.circular(2)),
              selectedColor: Color(0xffffffff),
              unselectedColor: Color(0xff595959),
              selectedTextStyle: TextStyle(color: Color(0xffA48BE2), fontSize: 14, fontWeight: FontWeight.w700),
              unselectedTextStyle: TextStyle(color: Color(0xff2C2C2C), fontSize: 14, fontWeight: FontWeight.w700),
            ),
            isRadio: true,
            buttons: const ['TECHNOLOGY', 'AI', 'CLOUD', 'ROBOTICS', 'IOT'],
            onSelected: (value, index, isSelected) {},
          ),
        ],
      ),
    );
  }
}

class ImagePickerWidget extends StatelessWidget {
  final Function(File) onImageSelected;
  final File? selectedImage;

  const ImagePickerWidget({
    super.key,
    required this.onImageSelected,
    this.selectedImage,
  });

  Future<void> pickImage(BuildContext context) async {
    try {
      await determinePosition();
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image != null) {
        onImageSelected(File(image.path));
      }
    } catch (error) {
      await Geolocator.openLocationSettings();
    }
  }

  Future<void> determinePosition() async {
    // Implement location permission logic here if needed
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 330,
      height: 140,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: const Color.fromARGB(44, 255, 255, 255),
      ),
      child: InkWell(
        onTap: () => pickImage(context),
        child: selectedImage != null
            ? ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.file(
                  selectedImage!,
                  fit: BoxFit.cover,
                ),
              )
            : const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}