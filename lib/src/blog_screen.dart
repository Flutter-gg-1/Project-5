import 'package:blog_app/widget/text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class BlogScreen extends StatefulWidget {
  final String category, title, writer, time, date, summary, content;
  final bool isFaveiorte;

  const BlogScreen(
      {super.key,
      required this.category,
      required this.title,
      required this.writer,
      required this.time,
      required this.date,
      required this.summary,
      required this.content,
      required this.isFaveiorte});

  @override
  State<BlogScreen> createState() => _BlogScreenState();
}

class _BlogScreenState extends State<BlogScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(onPressed: () {}, child: const CustomText(text: 'Aa')),
          IconButton(
              onPressed: (){},
              icon:widget.isFaveiorte
                  ? const Icon(
                      Icons.bookmark,
                      color: Colors.white,
                    )
                  : const Icon(Icons.bookmark_outline)),
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.edit_outlined)),
        ],
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 266,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
              ),
              child: const Center(
                child: Text(
                  'Blog',
                  style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Inter'),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const Icon(
                  Icons.account_tree_outlined,
                  color: Color(0xffbaa4f3),
                ),
                Text(
                  '  ${widget.category.toUpperCase()}',
                  style: const TextStyle(
                      color: Color(0xffbaa4f3),
                      fontSize: 14,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(
                widget.title,
                style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Inter'),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 8),
              width: 28,
              height: 28,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: Image.asset('assest/image/Vector.png'),
            ),
            Text(
              widget.writer,
              style: const TextStyle(
                  color: Color(0xff646464),
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Text(
                '${widget.time} min read • ${widget.date}',
                style: const TextStyle(
                    color: Color(0xff646464),
                    fontSize: 12,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Row(
              children: [
                Brand(
                  Brands.facebook_f,
                  size: 20,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: Icon(
                    Bootstrap.twitter,
                    color: Color(0xffc2c2c2),
                    size: 17,
                  ),
                ),
                const Icon(Iconsax.link_21_bold,
                    color: Color(0xffc2c2c2), size: 20)
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(top: 20, bottom: 10),
              child: CustomText(text: 'Summary'),
            ),
            Text(
              widget.summary,
              style: const TextStyle(
                  color: Color(0xff646464),
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 20, bottom: 10),
              child: CustomText(text: 'Content'),
            ),
            Text(
              widget.content,
              style: const TextStyle(
                  color: Color(0xff646464),
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      )),
    );
  }
}
