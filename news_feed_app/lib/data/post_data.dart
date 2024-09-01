import 'package:get_storage/get_storage.dart';
import 'package:news_feed_app/data/models/post_data_model.dart';

class PostData {
  List<PostDataModel> postsList = [];
  final box = GetStorage();

  PostData() {
    loadPosts(); // Load posts when the instance is created
  }

  void addNewPost({required PostDataModel newPost}) {
    postsList.add(newPost);
    savePosts(); // Save posts after adding a new one
  }

  void updatePost(int id, {required String title, required String summary, required String content}) {
    final index = postsList.indexWhere((post) => post.id == id);
    if (index != -1) {
      final post = postsList[index];
      postsList[index] = PostDataModel(
        id: post.id,
        category: post.category,
        author: post.author,
        title: title,
        summary: summary,
        content: content,
        date: post.date,
        minutes: post.minutes,
        image: post.image,
      );
      savePosts(); // Save posts after updating
    }
  }

  void deletePost(int id) {
    postsList.removeWhere((post) => post.id == id);
    savePosts(); // Save posts after deletion
  }

  void savePosts() async {
    // Convert postsList to a list of maps for storage
    List<Map<String, dynamic>> postsToSave = postsList.map((post) => post.tojson()).toList();
    await box.write('postsList', postsToSave);
  }

  void loadPosts() {
    if (box.hasData('postsList')) {
      List<dynamic> loadedPosts = box.read('postsList');
      postsList = loadedPosts.map((postMap) => PostDataModel.fromjson(postMap)).toList();
    }
  }
}