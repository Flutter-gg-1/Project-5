import 'package:flutter/material.dart';
import 'package:project_5/components/text/text_custom.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project_5/data_layer/blog_data.dart';
import 'package:project_5/data_layer/login_data.dart';
import 'package:project_5/pages/edit_blog_screen.dart';
import 'package:project_5/services/setup.dart';

class BlogPage extends StatefulWidget {
  const BlogPage({super.key, required this.selectedId});

  final int selectedId;

  @override
  State<BlogPage> createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
  bool saveChanges = false;

  @override
  Widget build(BuildContext context) {
    var selectedBlog = getIt
        .get<BlogData>()
        .blogs
        .firstWhere((e) => e.id == widget.selectedId);

    return Scaffold(
      floatingActionButton: saveChanges
          ? FloatingActionButton(
              backgroundColor: Colors.white,
              onPressed: () {
                saveChanges = false;
                Navigator.pop(context, true);
              },
              child: const Center(
                child: TextCustom(
                    text: "Save",
                    color: Colors.black,
                    weight: FontWeight.w700,
                    fontSize: 18),
              ),
            )
          : const SizedBox.shrink(),
      backgroundColor: const Color(0xff111111),
      appBar: AppBar(
        backgroundColor: const Color(0xff191818),
        actions: [
          const Icon(
            Icons.text_fields_rounded,
            color: Colors.white,
          ),
          IconButton(
              onPressed: () {
                getIt.get<BlogData>().toggleFavorite(id: widget.selectedId);

                saveChanges = true;
                setState(() {});
              },
              icon: Icon(
                selectedBlog.isFavorite!
                    ? Icons.bookmark
                    : Icons.bookmark_border,
                color: Colors.white,
              )),
          getIt.get<LoginData>().checkLogin() == true
              ? IconButton(
                  onPressed: () {
                    saveChanges = true;
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EditBlogScreen(
                                  selectedId: widget.selectedId,
                                ))).then((onValue) {
                      if (onValue != null) {
                        setState(() {});
                      }
                    });
                  },
                  icon: const Icon(
                    Icons.edit,
                    color: Colors.white,
                  ))
              : const SizedBox()
        ],
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Image.asset("assets/Image.png"),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.feed_outlined,
                          color: Color(0xffBDA6F5),
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        TextCustom(
                            text: selectedBlog.category,
                            color: const Color(0xffBDA6F5),
                            weight: FontWeight.w600,
                            fontSize: 14)
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    TextCustom(
                        text: selectedBlog.title,
                        color: Colors.white,
                        weight: FontWeight.w700,
                        fontSize: 20),
                    const SizedBox(
                      height: 8,
                    ),
                    Image.asset(
                      "assets/Vector.png",
                      height: 28,
                      width: 28,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const TextCustom(
                        text: "Kyle Barr",
                        color: Color(0xffB8B8B8),
                        weight: FontWeight.w500,
                        fontSize: 14),
                    const SizedBox(
                      height: 16,
                    ),
                    TextCustom(
                        text:
                            "${selectedBlog.minutesToRead} • ${selectedBlog.date}",
                        color: const Color(0xff888888),
                        weight: FontWeight.w500,
                        fontSize: 12),
                    const SizedBox(height: 16),
                    const Row(
                      children: [
                        FaIcon(
                          FontAwesomeIcons.facebook,
                          color: Color(0xffCFCFCF),
                        ),
                        SizedBox(
                          width: 13.4,
                        ),
                        FaIcon(
                          FontAwesomeIcons.twitter,
                          color: Color(0xffCFCFCF),
                        ),
                        SizedBox(
                          width: 13.4,
                        ),
                        FaIcon(
                          FontAwesomeIcons.link,
                          color: Color(0xffCFCFCF),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const TextCustom(
                        text: "Summary",
                        color: Color(0xffE8E8E8),
                        weight: FontWeight.w600,
                        fontSize: 16),
                    const SizedBox(
                      height: 16,
                    ),
                    TextCustom(
                        text: selectedBlog.summary,
                        color: const Color(0xffB8B8B8),
                        weight: FontWeight.w500,
                        fontSize: 14),
                    const SizedBox(
                      height: 32,
                    ),
                    const TextCustom(
                        text: "Content",
                        color: Color(0xffE8E8E8),
                        weight: FontWeight.w600,
                        fontSize: 16),
                    const SizedBox(
                      height: 30,
                    ),
                    TextCustom(
                        text: selectedBlog.content,
                        color: const Color(0xffB8B8B8),
                        weight: FontWeight.w500,
                        fontSize: 14)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
