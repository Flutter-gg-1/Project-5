import 'package:flutter/material.dart';
import 'package:project_5/src/models/post_models.dart'; // Import your PostModel

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController _searchController = TextEditingController();
  List<PostModel> _allPosts = []; // Replace with your list of posts
  List<PostModel> _filteredPosts = [];

  @override
  void initState() {
    super.initState();
    // Initialize your list of posts with actual data
    _allPosts = [
      // Add your posts here
      PostModel(
        // id: 1,
        // idUser: 1,
        title: 'Google’s Bard AI Chatbot update',
        summary: 'New features added to Google’s Bard AI chatbot.',
        content: 'Content of the post...',
        image: 'assets/G.png',
        category: 'Tech',
        readingMinutes: '5',
      ),
      PostModel(
        // id: 2,
        // idUser: 2,
        title: 'watchOS 10 preview',
        summary: 'Widgets all the way down.',
        content: 'Detailed content about watchOS 10...',
        image: 'assets/watch.png',
        category: 'Tech',
        readingMinutes: '7',
      ),
    ];
    _filteredPosts = _allPosts; // Initially, show all posts
  }

  // Function to filter posts based on the search query
  void _filterPosts(String query) {
    if (query.isEmpty) {
      setState(() {
        _filteredPosts = _allPosts;
      });
    } else {
      setState(() {
        _filteredPosts = _allPosts
            .where((post) =>
                post.title!.toLowerCase().contains(query.toLowerCase()) ||
                post.summary!.toLowerCase().contains(query.toLowerCase()))
            .toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: 'Search for News',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[800],
              ),
              onChanged: _filterPosts,
            ),
            const SizedBox(height: 20),
            Expanded(
              child: _filteredPosts.isNotEmpty
                  ? ListView.builder(
                      itemCount: _filteredPosts.length,
                      itemBuilder: (context, index) {
                        final post = _filteredPosts[index];
                        return ListTile(
                          title: Text(post.title ?? 'No Title'),
                          subtitle: Text(post.summary ?? 'No Summary'),
                          onTap: () {
                            // Navigate to details screen or perform other actions
                          },
                        );
                      },
                    )
                  : const Center(
                      child: Text(
                        'No results found',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
