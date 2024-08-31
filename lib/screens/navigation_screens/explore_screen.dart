import 'package:blog_app/services/setup.dart';
import 'package:blog_app/widgets/custom_post_tile.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import '../../data/blog_data.dart';
import '../../models/post.dart';
import '../../models/user.dart';
import '../../styles/colours.dart';

class ExploreScreen extends StatefulWidget {
  final User? user;
  const ExploreScreen({super.key, this.user});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  late User? user;
  TextEditingController searchController = TextEditingController();
  String search = '';
  List<Post> results = [];

  @override
  void initState() {
    user = widget.user;
    updateResults(searchController.text);
    super.initState();
  }

  updateResults(String word) {
    results.clear();
    search = word;
    for (var post in locator.get<BlogData>().posts) {
      if (post.title.toLowerCase().contains(word.toLowerCase())) {
        results.add(post);
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 50),
      child: Column(
        children: [
          ListTile(
            tileColor: Colours.chipPrimary,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            leading: const Icon(
              FontAwesome.magnifying_glass_solid,
              color: Colours.textSecondary,
            ),
            title: TextField(
              controller: searchController,
              style: const TextStyle(color: Colours.textSecondary),
              cursorColor: Colours.textPrimary,
              decoration: const InputDecoration(
                hintText: 'Search for News',
                hintStyle:
                    TextStyle(fontSize: 14, color: Colours.textSecondary),
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
              ),
              onSubmitted: (value) async {
                if (value.isNotEmpty) {
                  await updateResults(value);
                } else {
                  setState(() {
                    results.clear();
                  });
                }
              },
            ),
          ),
          const SizedBox(
            height: 45,
          ),
          if (search.isNotEmpty)
            Expanded(
              child: results.isNotEmpty
                  ? Card(
                      color: Colours.surfaceTertiary,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            ...List.generate(results.length, (index) {
                              return Column(
                                children: [
                                  CustomPostTile(
                                      post: results[index], user: user),
                                  const SizedBox(
                                    height: 20,
                                  )
                                ],
                              );
                            })
                          ],
                        ),
                      ),
                    )
                  : const Center(
                      child: Text(
                        'No results found',
                        style: TextStyle(
                            fontSize: 20, color: Colours.textSecondary),
                      ),
                    ),
            )
          else
            const Expanded(
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      FontAwesome.magnifying_glass_solid,
                      color: Colours.textSecondary,
                    ),
                    SizedBox(
                      width: 13,
                    ),
                    Text(
                      'Search for News',
                      style:
                          TextStyle(fontSize: 20, color: Colours.textSecondary),
                    )
                  ],
                ),
              ),
            )
        ],
      ),
    );
  }
}
