import 'package:flutter/material.dart';
import 'package:vlog_project/helper/navigation.dart';

class CardView extends StatelessWidget {
  const CardView({
    super.key,
    required this.title,
    required this.subtitle,
    required this.date,
    required this.imagePath, required this.screentogo, // Pass the image path as a string
  });

  final String title;
  final String subtitle;
  final String date;
  final String imagePath;
  // String representing the image asset path
  final Widget screentogo;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          context.push(screen: screentogo);
        },
        child: Container(
          width: 400,
          padding: EdgeInsets.all(8.0), // Adding padding to the container
          decoration: BoxDecoration(
            color: Color(0xff1E1E1E),
            borderRadius: BorderRadius.circular(8.0), // Rounded corners
          ),
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start, // Align content to the start (left)
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment
                    .start, // Align items at the top of the row
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(
                        8.0), // Rounded corners for the image
                    child: Image.asset(
                      imagePath, // Correct usage of Image.asset with the string path
                      width: 60, // Adjust size to fit well
                      height: 60,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    // Allows the text column to take available space
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start, // Align text to the left
                      children: [
                        Text(
                          title,
                          style: TextStyle(color: Colors.grey),
                        ),
                        SizedBox(
                            height: 4), // Add a little space between the texts
                        Text(
                          subtitle,
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8), // Space between the text and bottom row
              Row(
                children: [
                  Text(
                    date,
                    style: TextStyle(color: Colors.grey),
                  ),
                  Spacer(),
                  IconButton(
                    icon: Icon(Icons.bookmark_border, color: Colors.grey),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.more_vert, color: Colors.grey),
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
