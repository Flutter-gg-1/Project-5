import 'package:flutter/material.dart';

class NoBlogsAvailable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'No blogs available.',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
