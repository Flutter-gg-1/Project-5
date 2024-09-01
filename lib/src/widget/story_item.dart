import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:project_5/src/data_layer/post_data.dart';
import 'package:project_5/src/home/detail_screen.dart';

class StoryItem extends StatelessWidget {
  const StoryItem({
    super.key,
    required this.username,
    required this.title,
    required this.date,
    required this.index,
    required this.image,
  });

  final String username;
  final String image;
  final String title;
  final String date;
  final int index;

  @override
  Widget build(BuildContext context) {
    final posts = GetIt.I<PostData>().allPost;

    return GestureDetector(
      onTap: () {
        // Navigate to the DetailScreen when tapped
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DetailScreen(
                    index: index,
                    category: posts[index].category.toString(),
                    image: posts[index].image.toString(),
                    title: posts[index].title.toString(),
                    content: posts[index].content.toString(),
                    username: posts[index].username.toString(),
                    summary: posts[index].summary.toString(),
                    creationDate: posts[index].creationDate.toString(),
                  ) // Navigate to DetailScreen
              ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage(image), // Display the provided image
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    username,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    date,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Sample DetailScreen for navigation
// class DetailScreen extends StatelessWidget {
//   final int index;

//   const DetailScreen({Key? key, required this.index}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Detail Screen'),
//       ),
//       body: Center(
//         child: Text(
//           'Details of item $index', // Display details based on index
//           style: const TextStyle(fontSize: 24),
//         ),
//       ),
//     );
//   }
// }
