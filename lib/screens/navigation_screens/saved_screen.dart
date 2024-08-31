import 'package:flutter/material.dart';
import '../../models/user.dart';
import '../../styles/colours.dart';

class SavedScreen extends StatefulWidget {
  final User? user;
  const SavedScreen({super.key, this.user});

  @override
  State<SavedScreen> createState() => _SavedScreenState();
}

class _SavedScreenState extends State<SavedScreen> {
  @override
  Widget build(BuildContext context) {
    return const Padding(
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
      );
  }
}
