import 'package:blog_app/services/setup.dart';
import 'package:flutter/material.dart';
import '../../models/user.dart';
import '../../styles/colours.dart';
import '../../widgets/custom_post_tile.dart';

class SavedScreen extends StatefulWidget {
  final User? user;
  const SavedScreen({super.key, this.user});

  @override
  State<SavedScreen> createState() => _SavedScreenState();
}

class _SavedScreenState extends State<SavedScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Saved News',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colours.textPrimary),
          ),
          SizedBox(height: 45,),
          if (widget.user != null)
            if (widget.user!.saved.isNotEmpty)
              Expanded(
                  child: Card(
                color: Colours.surfaceTertiary,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ...List.generate(widget.user!.saved.length, (index) {
                        return Column(
                          children: [
                            CustomPostTile(
                                post: widget.user!.saved[index],
                                user: widget.user),
                            const SizedBox(
                              height: 20,
                            )
                          ],
                        );
                      })
                    ],
                  ),
                ),
              ))
            else
              const Expanded(
                child: Center(
                  child: Text(
                    'No news Found',
                    style:
                        TextStyle(fontSize: 20, color: Colours.textSecondary),
                  ),
                ),
              )
          else
            const Expanded(
                child: Center(
                    child: Text(
              'You must be logged in to view saved news',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, color: Colours.textSecondary),
            ))),
        ],
      ),
    );
  }
}
