import 'dart:io';
import 'dart:math';
import 'package:intl/intl.dart';
import 'package:blog_app_project/data/blog_data.dart';
import 'package:blog_app_project/helper/extensions/screen.dart';
import 'package:blog_app_project/model/blog_model.dart';
import 'package:blog_app_project/services/setup.dart';
import 'package:blog_app_project/widgets/custom_textformfield.dart';
import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';

class AddBlogScreen extends StatefulWidget {
  const AddBlogScreen({super.key});

  @override
  State<AddBlogScreen> createState() => _AddBlogScreenState();
}

class _AddBlogScreenState extends State<AddBlogScreen> {
  File? image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedImage != null) {
        image = File(pickedImage.path);
      } else {}
    });
  }

  TextEditingController? controllerTitle = TextEditingController();
  TextEditingController? controllerSummary = TextEditingController();
  TextEditingController? controllerContent = TextEditingController();
  TextEditingController? controllerRreadingTime = TextEditingController();
  String category = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff111111),
      appBar: AppBar(
        backgroundColor: const Color(0xff111111),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          TextButton(
              onPressed: () {
                getIt.get<BlogData>().addBlog(BlogModel(
                      id: Random().nextInt(1000),
                      authorName: 'anas',
                      category: category,
                      content: controllerContent!.text,
                      summary: controllerSummary!.text,
                      title: controllerTitle!.text,
                      minutesToRead:
                          int.tryParse(controllerRreadingTime!.text)!,
                      date: DateFormat('MMM d, yyyy').format(DateTime.now()),
                    ));
                Navigator.pop(context);
                setState(() {});
              },
              child: const Text(
                'Save',
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
      body: SafeArea(
          child: SingleChildScrollView(
              child: Column(
        children: [
          SizedBox(
            height: context.getHeight() / 19,
          ),
          SizedBox(
            height: context.getHeight() / 74,
          ),
          const Row(
            children: [
              Text(
                'Image',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 17,
                    fontFamily: 'Inter'),
              ),
            ],
          ),
          SizedBox(
            height: context.getHeight() / 74,
          ),
          Container(
              width: context.getWidth(),
              height: context.getHeight() / 6,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: const Color(0xffffffff).withOpacity(0.12)),
              child: image == null
                  ? IconButton(
                      onPressed: () {
                        getImage();
                      },
                      icon: const FaIcon(
                        FontAwesomeIcons.plus,
                        color: Color(0xffffffff),
                        size: 45,
                      ),
                    )
                  : Image.file(
                      image!,
                    )),
          AddBlogCustom(
            controllerContent: controllerContent,
            controllerSummary: controllerSummary,
            controllerTitle: controllerTitle,
            controllerTime: controllerRreadingTime,
            categoryType: category,
          )
        ],
      ))),
    );
  }
}

class AddBlogCustom extends StatelessWidget {
  AddBlogCustom(
      {super.key,
      required this.categoryType,
      required this.controllerContent,
      required this.controllerSummary,
      required this.controllerTime,
      required this.controllerTitle});

  final TextEditingController? controllerTitle;
  final TextEditingController? controllerSummary;
  final TextEditingController? controllerContent;
  final TextEditingController? controllerTime;

  String categoryType = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: context.getHeight() / 30,
        ),
        const Row(
          children: [
            Text(
              'Title',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 17,
                  fontFamily: 'Inter'),
            ),
            Padding(
              padding: EdgeInsets.only(left: 7, top: 0),
              child: Text(
                '*',
                style: TextStyle(color: Color(0xffDD403C), fontSize: 20),
              ),
            )
          ],
        ),
        SizedBox(
          height: context.getHeight() / 74,
        ),
        CustomTextFormFelid(
          minLines: 2,
          hinttext: 'Enter your blog title',
          controller: controllerTitle,
        ),
        SizedBox(
          height: context.getHeight() / 30,
        ),
        const Row(
          children: [
            Text(
              'Summary',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 17,
                  fontFamily: 'Inter'),
            ),
            Padding(
              padding: EdgeInsets.only(left: 7, top: 0),
              child: Text(
                '*',
                style: TextStyle(color: Color(0xffDD403C), fontSize: 20),
              ),
            )
          ],
        ),
        SizedBox(
          height: context.getHeight() / 74,
        ),
        CustomTextFormFelid(
          minLines: 4,
          hinttext: 'Give a brief summary about your blog',
          controller: controllerSummary,
        ),
        SizedBox(
          height: context.getHeight() / 30,
        ),
        const Row(
          children: [
            Text(
              'Content',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 17,
                  fontFamily: 'Inter'),
            ),
            Padding(
              padding: EdgeInsets.only(left: 7, top: 0),
              child: Text(
                '*',
                style: TextStyle(color: Color(0xffDD403C), fontSize: 20),
              ),
            )
          ],
        ),
        SizedBox(
          height: context.getHeight() / 74,
        ),
        CustomTextFormFelid(
          minLines: 12,
          hinttext: 'write your blog here',
          controller: controllerContent,
        ),
        SizedBox(
          height: context.getHeight() / 30,
        ),
        const Row(
          children: [
            Text(
              'Category',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 17,
                  fontFamily: 'Inter'),
            ),
            Padding(
              padding: EdgeInsets.only(left: 7, top: 0),
              child: Text(
                '*',
                style: TextStyle(color: Color(0xffDD403C), fontSize: 20),
              ),
            )
          ],
        ),
        SizedBox(
          height: context.getHeight() / 74,
        ),
        CustomRadioButton(
          autoWidth: true,
          elevation: 0,
          absoluteZeroSpacing: true,
          unSelectedColor: const Color(0xff595959),
          selectedBorderColor: Colors.transparent,
          unSelectedBorderColor: Colors.transparent,
          selectedColor: Colors.white, // bg color
          buttonLables: const [
            'Technology',
            'AI',
            'Cloud',
            'Robotic',
            'IOT',
          ],
          buttonValues: const [
            "Technology",
            "AI",
            'Cloud',
            'Roboric',
            'IOT',
          ],
          buttonTextStyle: const ButtonTextStyle(
            selectedColor: Color(0xffA48BE2),
            unSelectedColor: Color(0xff2C2C2C),
            textStyle: TextStyle(fontSize: 16),
          ),
          radioButtonValue: (value) {
            categoryType = value;
          },
        ),
        SizedBox(
          height: context.getHeight() / 30,
        ),
        const Row(
          children: [
            Text(
              'Reading minutes',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 17,
                  fontFamily: 'Inter'),
            ),
            Padding(
              padding: EdgeInsets.only(left: 7, top: 0),
              child: Text(
                '*',
                style: TextStyle(color: Color(0xffDD403C), fontSize: 20),
              ),
            )
          ],
        ),
        SizedBox(
          height: context.getHeight() / 74,
        ),
        CustomTextFormFelid(
          minLines: 2,
          hinttext: 'Minutes of reading this blog',
          controller: controllerTime,
        ),
        SizedBox(
          height: context.getHeight() / 74,
        ),
      ],
    );
  }
}

String formatDate(DateTime date) {
  return DateFormat('MMM d, yyyy').format(date);
}
