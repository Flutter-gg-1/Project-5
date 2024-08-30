import 'package:blog_app/services/extensions/screen.dart';
import 'package:flutter/material.dart';

import '../models/post.dart';
import '../styles/colours.dart';

class NewsScreen extends StatelessWidget {
  final Post post;
  const NewsScreen({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colours.iconPrimary,),
        actions: [
          Icon(Icons.format_size_outlined,color: Colours.iconPrimary,),
          Icon(Icons.bookmark_border_outlined,color: Colours.iconPrimary,)
        ],
      ),
      body: Column(
        children: [
        Container(
          height: context.getHeight()/3.25,
          width: context.getWidth(),
          decoration: BoxDecoration(image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/images/1.png'))),
        ),
        Text(post.category),
        
      ],),
    );
  }
}