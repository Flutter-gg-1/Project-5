import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:project_5/src/data_layer/post_data.dart';
import 'package:project_5/src/theme/colors.dart';

class UpperPosts extends StatelessWidget {
  final int count;

  UpperPosts({super.key, required this.count});

  @override
  Widget build(BuildContext context) {
    // Accessing the image inside the build method to avoid initialization errors
    var post = GetIt.I<PostData>().allPost[count - 1];
    var image1 = post.image;

    return GestureDetector(
      // TODO: Uncomment and implement the onTap to navigate to the DetailScreen
      // onTap: () {
      //   // Navigate to the DetailScreen when tapped
      //   Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //       builder: (context) => DetailScreen(index: count),
      //     ),
      //   );
      // },
      child: Container(
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.symmetric(horizontal: 5.0),
        decoration: BoxDecoration(
          color: AppColors.grey,
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            // Use NetworkImage or AssetImage based on your image source
            image: image1 != null
                ? AssetImage(image1)
                : AssetImage(
                    'assets/default_image.png'), // Provide a default image if image1 is null
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Text(
            textAlign: TextAlign.left,
            '${post.title}', // Display the title of the post
            style: const TextStyle(
              fontSize: 16.0,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
