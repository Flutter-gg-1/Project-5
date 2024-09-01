import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_5/src/data_layer/post_data.dart';
import 'package:project_5/src/home/guest_home_screen.dart';
import 'package:project_5/src/home/screens/saved_screen.dart';

class DetailScreen extends StatelessWidget {
  final String image;
  final String title;
  final String content;
  final int index;
  final String category;
  final String username;
  final String creationDate;
  final String summary;

  DetailScreen({
    super.key,
    required this.index,
    required this.image,
    required this.title,
    required this.content,
    required this.category,
    required this.username,
    required this.creationDate,
    required this.summary,
  });

  final posts = GetIt.I<PostData>().allPost;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[900],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  iconSize: 30,
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => GuestHomeScreen()));
                  },
                ),
                IconButton(
                    iconSize: 30,
                    icon: const Icon(Icons.bookmark),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => SavedScreen()));
                    }),
              ],
            ),
            // Top Image Section
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
              child: Image.asset(
                image, // Use the passed image URL
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title Section
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        category,
                        style: GoogleFonts.roboto(
                          color: Colors.blueAccent,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(Icons.more_vert, color: Colors.white),
                    ],
                  ),
                  SizedBox(height: 8),
                  Text(
                    title, // Use the passed title
                    style: GoogleFonts.roboto(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  // Subtitle Section
                  Row(children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://via.placeholder.com/150'), // Replace with actual username image URL
                      radius: 12,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            username,
                            style: GoogleFonts.roboto(
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                          ),
                          SizedBox(width: 10),
                          Text(
                            creationDate,
                            style: GoogleFonts.roboto(
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]),
                  SizedBox(height: 16),
                  // Summary Section
                  Text(
                    'summary',
                    style: GoogleFonts.roboto(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    summary, // Use the passed content
                    style: GoogleFonts.roboto(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(height: 16),
                  // Content Section
                  Text(
                    'Content',
                    style: GoogleFonts.roboto(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    content, // Use the passed content again for content details
                    style: GoogleFonts.roboto(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(height: 16),
                  // Action Icons
                  Row(
                    children: [
                      Icon(Icons.share, color: Colors.grey),
                      SizedBox(width: 16),
                      Icon(Icons.favorite_border, color: Colors.grey),
                    ],
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
