import 'package:blog_app/helper/screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ArticalScreen extends StatefulWidget {
  const ArticalScreen({super.key});

  @override
  State<ArticalScreen> createState() => _ArticalScreenState();
}

class _ArticalScreenState extends State<ArticalScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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
              const Divider(
                color: Colors.transparent,
              ),
              TextButton(
                  onPressed: () {},
                  child: const Row(
                    children: [Icon(Icons.feed), Text("Type")],
                  )),
              const Text(style: TextStyle(fontSize: 24), "Title"),
              const Divider(
                color: Colors.transparent,
              ),
              const CircleAvatar(
                child: Icon(Icons.person),
              ),
              const Divider(
                color: Colors.transparent,
              ),
              const Text("writer"),
              const Text("date"),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.facebook),
                  Icon(FontAwesomeIcons.twitter),
                  Icon(Icons.link),
                ],
              ),
              const Divider(
                color: Colors.transparent,
                height: 30,
              ),
              const ListTile(
                title: Text("Sammary"),
                subtitle: Text("words"),
              ),
              const Divider(
                color: Colors.transparent,
                height: 30,
              ),
              const ListTile(
                title: Text("content"),
                subtitle: Text("words"),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
