import 'package:blog_app/data_layer/get_blog.dart';
import 'package:blog_app/helper/nav.dart';
import 'package:blog_app/helper/screen.dart';
import 'package:blog_app/model/blog_model.dart';
import 'package:blog_app/screens/edit_blog.dart';
import 'package:blog_app/widget/button/divider/custom_dvider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_it/get_it.dart';

class ArticalScreen extends StatefulWidget {
  const ArticalScreen({required this.blog, super.key});
  final BlogModel blog;
  @override
  State<ArticalScreen> createState() => _ArticalScreenState();
}

class _ArticalScreenState extends State<ArticalScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: widget.blog.saved
                ? const Icon(Icons.bookmark)
                : const Icon(Icons.bookmark_border),
            onPressed: () {
              GetIt.I.get<GetBlog>().editBookMark(widget.blog);

              setState(() {});
            },
          ),
          GetIt.I.get<GetBlog>().currentUser.userName.isNotEmpty
              ? IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () {
                    context.navToUpdate(
                        EditBlog(
                          blog: widget.blog,
                        ), () {
                      setState(() {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ArticalScreen(
                                      blog: widget.blog,
                                    )));
                      });
                    });
                  },
                )
              : const SizedBox()
        ],
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: context.getWidth(),
                height: context.getHight(value: .2),
                child: const Placeholder(),
              ),
              const CustomDivider(),
              TextButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      const Icon(Icons.feed),
                      Text(widget.blog.category)
                    ],
                  )),
              Text(style: const TextStyle(fontSize: 24), widget.blog.title),
              const Divider(
                color: Colors.transparent,
              ),
              const CircleAvatar(
                child: Icon(Icons.person),
              ),
              const Divider(
                color: Colors.transparent,
              ),
              Text(widget.blog.title),
              Text(widget.blog.date),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.facebook),
                  Icon(FontAwesomeIcons.twitter),
                  Icon(Icons.link),
                ],
              ),
              const CustomDivider(height: 30),
              ListTile(
                title: const Text("Summary"),
                subtitle: Text(widget.blog.summary),
              ),
              const CustomDivider(height: 30),
              ListTile(
                title: const Text("content"),
                subtitle: Text(widget.blog.content),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
