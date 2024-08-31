import 'package:blog_app/data/post_data.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_it/get_it.dart';

class NewsScreen extends StatelessWidget {
  final String? image;
  final String category;
  final String title;
  final String summary;
  final String content;
  final String min;
  final String date;
  final String? userAvatar;

  const NewsScreen({
    super.key,
    required this.image,
    required this.title,
    required this.summary,
    required this.content,
    required this.min,
    required this.date,
    required this.category,
    this.userAvatar,
  });

  @override
  Widget build(BuildContext context) {
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
        actions: const [
          Icon(
            Icons.font_download_outlined,
            color: Colors.white,
          ),
          SizedBox(width: 10),
          Icon(
            Icons.bookmark_border,
            color: Colors.white,
            size: 30,
          ),
          SizedBox(width: 20)
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 260,
                width: double.infinity,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(image ?? "assets/img_holder.png"))),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Icon(FontAwesomeIcons.tencentWeibo,
                      color: Color(0xffBDA6F5), size: 20),
                  const SizedBox(width: 5),
                  Text(
                    category,
                    style:
                        const TextStyle(fontSize: 14, color: Color(0xffBDA6F5)),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(title,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w400)),
              const SizedBox(height: 10),
              CircleAvatar(
                  backgroundImage:
                      AssetImage(userAvatar ?? "assets/avatar_holder.png")),
              const SizedBox(height: 5),
              Text(
                GetIt.I.get<PostData>().allPostes.first.auther,
                style: const TextStyle(fontSize: 14, color: Color(0xffB8B8B8)),
              ),
              const SizedBox(height: 15),
              Text(
                "${GetIt.I.get<PostData>().allPostes.first.minutes} min read • ${GetIt.I.get<PostData>().allPostes.first.date}",
                style: const TextStyle(color: Color(0xffB8B8B8), fontSize: 12),
              ),
              const SizedBox(height: 15),
              const Row(children: [
                SizedBox(width: 5),
                Icon(FontAwesomeIcons.facebookF, color: Colors.white, size: 15),
                SizedBox(width: 10),
                Icon(FontAwesomeIcons.twitter, color: Colors.white, size: 15),
                SizedBox(width: 10),
                Icon(FontAwesomeIcons.link, color: Colors.white, size: 15)
              ]),
              const SizedBox(height: 30),
              const Text("Summary",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500)),
              const SizedBox(height: 15),
              Text(summary,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w300)),
              const SizedBox(height: 30),
              const Text("Content",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500)),
              const SizedBox(height: 15),
              Text(content,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w300)),
            ],
          ),
        ),
      ),
    );
  }
}
