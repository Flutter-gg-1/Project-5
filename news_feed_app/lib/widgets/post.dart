import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Post extends StatelessWidget {
  const Post({
    super.key,
    required this.title,
    required this.username,
    required this.imgPath,
    required this.dateAndTime,
    required this.summary,
    required this.content, required this.category, required this.minutes,
  });

  final String category;
  final String title;
  final String username;
  final String imgPath;
  final String dateAndTime;
  final String minutes;
  final String summary;
  final String content;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(
          width: 375,
          height: 240,
          child: Image.asset(imgPath, fit: BoxFit.cover),
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SvgPicture.asset('assets/svg/Technology.svg'),
                  const SizedBox(width: 5),
                   Text(
                    category,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0xffBDA6F5),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Color(0xffffffff),
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 10),
              Container(
                width: 30,
                height: 30,
                decoration: const BoxDecoration(
                  color: Color(0xffffffff),
                  shape: BoxShape.circle,
                ),
                 child: Image.asset('assets/images/person.png', fit: BoxFit.cover),
              ),
              const SizedBox(height: 8),
              Text(
                username,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color(0xffB8B8B8),
                ),
              ),
              const SizedBox(height: 15),
              Row(
                children: [ Text(
                  dateAndTime,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff888888),
                  ),
                ),
                Text(
                ' • ',
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff888888),
                ),
              ),
              Text(
                minutes,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff888888),
                ),
              ),
                ]
              ),
              const SizedBox(height: 15),
              SvgPicture.asset('assets/svg/socials.svg'),
              const SizedBox(height: 40),
              const Text(
                'Summary',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Color(0xffffffff),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                summary,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color(0xffB8B8B8),
                ),
              ),
              const SizedBox(height: 40),
              const Text(
                'Content',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Color(0xffffffff),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                content,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color(0xffB8B8B8),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}