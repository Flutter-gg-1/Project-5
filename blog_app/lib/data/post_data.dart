import 'package:blog_app/models/post_model.dart';
import 'package:blog_app/services/setup.dart';

class PostData {
  List<PostModel> allPostes = [];

  PostData() {
    loadPosts();
  }

  addPost({required PostModel newPost}) {
    allPostes.add(newPost);
    savePost();
  }

  savePost() {
    box.write("posts", allPostes);
  }

  loadPosts() {
    if (box.hasData("posts")) {
      for (var element in box.read("posts")) {
        allPostes.add(PostModel.fromJson(element));
      }
    }
  }
}
