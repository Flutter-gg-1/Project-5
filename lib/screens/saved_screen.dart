import 'package:flutter/material.dart';
import '../styles/colours.dart';

class SavedScreen extends StatelessWidget {
  const SavedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Saved News',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colours.textPrimary),
            ),
            Expanded(
                child: Center(
                    child: Text(
              'No news found',
              style: TextStyle(fontSize: 20, color: Colours.textSecondary),
            ))),
          ],
        ),
      ),
    );
  }
}
