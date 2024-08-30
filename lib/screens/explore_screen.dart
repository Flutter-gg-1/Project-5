import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

import '../styles/colours.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 50),
        child: Column(
          children: [
            ListTile(
              tileColor: Colours.chipPrimary,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              leading: const Icon(
                FontAwesome.magnifying_glass_solid,
                color: Colours.textSecondary,
              ),
              title: const TextField(
                style: TextStyle(color: Colours.textSecondary),
                cursorColor: Colours.textPrimary,
                decoration: InputDecoration(
                  hintText: 'Search for News',
                  hintStyle:
                      TextStyle(fontSize: 14, color: Colours.textSecondary),
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                ),
              ),
            ),
            const Expanded(
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      FontAwesome.magnifying_glass_solid,
                      color: Colours.textSecondary,
                    ),
                    SizedBox(width: 13,),
                    Text(
                      'Search for News',
                      style: TextStyle(fontSize: 20, color: Colours.textSecondary),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
