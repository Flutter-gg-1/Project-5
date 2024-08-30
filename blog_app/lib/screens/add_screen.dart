import 'package:blog_app/widgets/fields/info_feild.dart';
import 'package:blog_app/widgets/selectable_box.dart';
import 'package:flutter/material.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  @override
  Widget build(BuildContext context) {
    // Color selectedColor = const Color(0xff2C2C2C);
    String catValue;
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
              onPressed: () {},
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
              Container(
                alignment: Alignment.center,
                width: 337,
                height: 140,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(12, 255, 255, 255),
                    borderRadius: BorderRadius.circular(10)),
                child: const Icon(
                  Icons.add,
                  size: 50,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              const InfoFeild(title: "Title", hint: "Enter your blog title"),
              const SizedBox(height: 20),
              const InfoFeild(
                title: "Summary",
                hint: "Enter your blog title",
                max: 3,
              ),
              const SizedBox(height: 20),
              const InfoFeild(
                title: "Content",
                hint: "Enter your blog title",
                max: 6,
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
                  SizedBox(width: 5),
                  SelectableBox(
                    category: 'AI',
                    onTap: () {
                      catValue = "TECHNOLOGY";
                    },
                  ),
                  SizedBox(width: 5),
                  SelectableBox(
                    category: 'CLOUD',
                    onTap: () {
                      catValue = "CLOUD";
                    },
                  ),
                  SizedBox(width: 5),
                  SelectableBox(
                    category: 'ROBOTIC',
                    onTap: () {
                      catValue = "ROBOTIC";
                    },
                  ),
                  SizedBox(width: 5),
                  SelectableBox(
                    category: 'IOT',
                    onTap: () {
                      catValue = "IOT";
                    },
                  )
                ],
              ),
              const SizedBox(height: 20),
              const InfoFeild(
                  title: "Reading minutes",
                  hint: "Minutes of reading this blog")
            ],
          ),
        ),
      ),
    );
  }
}
