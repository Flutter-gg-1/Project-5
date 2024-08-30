import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:project5/data/all_posts.dart';
import 'package:project5/models/post.dart';

class ImagesCarousel extends StatelessWidget {
  final List<String> images;
  const ImagesCarousel({super.key, required this.images});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 343,
      height: 180,
      child: PageView(
        children: List.generate(3, (index){
          Post currentPost = GetIt.I.get<AllPosts>().posts[index];
          return Stack(
            children: [
              Image.asset(images[index]),
              Padding(
                padding: const EdgeInsets.only(bottom: 16, left: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(currentPost.date, style: const TextStyle(color: Color(0xffb8b8b8), fontSize: 10, fontWeight: FontWeight.w500),),
                    const SizedBox(height: 4,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 240,
                          child: Text(currentPost.title, style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w700))),
                        IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_outward_outlined, color: Colors.white,))
                      ],
                    ),
                  ],
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}