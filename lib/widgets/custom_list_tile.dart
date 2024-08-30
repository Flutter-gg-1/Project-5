import 'package:flutter/material.dart';

import '../models/post.dart';
import '../styles/colours.dart';

class CustomListTile extends StatelessWidget {
  final Post post;
  const CustomListTile({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colours.surfaceTertiary,
      title: Column(
        children: [
          Row(
            children: [
              Card(
                child: Image.asset('assets/images/1.png'),
              ),
              SizedBox(width: 8,),
              const SizedBox(
                width: 240,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Kyle Barr',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colours.textSecondary,
                        )),
                    Text(
                        'Now Google’s Bard AI can talk & respond to visual prompts',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colours.iconSecondary,
                          // overflow: TextOverflow.visible,
                        )),
                  ],
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Row(
                children: [
                  Text('Jul 13, 2023 - ',
                      style: TextStyle(
                        fontSize: 10,
                        color: Colours.textTertiary,
                      )),
                  Text('2 min read',
                      style: TextStyle(
                        fontSize: 10,
                        color: Colours.textTertiary,
                      )),
                ],
              ),
              Row(
                children: [
                  InkWell(
                      onTap: () {},
                      child: const Icon(
                        Icons.abc,
                        color: Colours.textTertiary,
                      )),
                  InkWell(
                      onTap: () {},
                      child: const Icon(
                        Icons.abc,
                        color: Colours.textTertiary,
                      )),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
