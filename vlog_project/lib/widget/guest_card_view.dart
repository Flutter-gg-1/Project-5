import 'package:flutter/material.dart';
import 'package:vlog_project/helper/navigation.dart';

class GuestCardView extends StatelessWidget {
  const GuestCardView({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.date,
    required this.imagePath,
    required this.screentogo, // Add the screentogo parameter
  }) : super(key: key);

  final String title;
  final String subtitle;
  final String date;
  final String imagePath;
  final Widget screentogo; // Define the screentogo variable

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.push(screen: screentogo); // Handle navigation when tapped
      },
      child: Container(
        width: 450,
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: const Color(0xff1E1E1E),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    imagePath,
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        subtitle,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Text(
                  date,
                  style: const TextStyle(color: Colors.grey),
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.bookmark_border, color: Colors.grey),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.more_vert, color: Colors.grey),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
