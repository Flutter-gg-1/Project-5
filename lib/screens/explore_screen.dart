import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:project5/data/all_posts.dart';
import 'package:project5/extensions/screen_push.dart';
import 'package:project5/models/post.dart';
import 'package:project5/screens/view_post_screen.dart';
import 'package:project5/widgets/cards/post_card.dart';
import 'package:project5/widgets/no_results_found.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  TextEditingController searchController = TextEditingController();
  List<Post> searchResult = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff111111),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              TextField(
                onChanged: (value) {
                  searchResult = GetIt.I.get<AllPosts>().searchPost(searchTerm: value);
                  setState(() {});
                },
                onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
                controller: searchController,
                style: const TextStyle(color: Colors.white),
                textAlignVertical: const TextAlignVertical(y: 0),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.12),
                  prefixIcon: const Icon(Icons.search, color: Color(0xffb8b8b8), size: 25,),
                  hintText: "Search for News",
                  hintStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Color(0xffb8b8b8))
                ),
              ),
              const SizedBox(height: 45),
              searchResult.isEmpty ? const NoResultsFound(message: 'Search for a news', icon: Icons.search)
              : Expanded(
                child: ListView.builder(
                  itemCount: searchResult.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        PostCard(
                          post: searchResult[index],
                          onTap: (){
                            context.push(
                              target: ViewPostScreen(post: searchResult[index]),
                              saveData: (p0) {
                                if(p0==true){
                                  setState(() {});
                                }
                              },
                            );
                          },
                        ),
                        const SizedBox(height: 12)
                      ],
                    );
                  }
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}