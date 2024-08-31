import 'package:blog_app/data/user_data.dart';
import 'package:blog_app/models/post_model.dart';
import 'package:blog_app/services/setup.dart';
import 'package:get_it/get_it.dart';

class PostData {
  List<PostModel> allPostes = [];
  List<PostModel> savedPostes = [];
  List<PostModel> userPosts = [];
  PostData() {
    loadPosts();
  }

  addPost({required PostModel newPost}) {
    allPostes.add(newPost);
    userPosts.add(newPost);
    savePost();
    GetIt.I.get<UserData>().users.first.posts = userPosts;
  }

  savePost() {
    box.write("posts", allPostes);
    box.write("userPosts", userPosts);
    box.write("savedPostes", savedPostes);
  }

  removePost({String? id}) {
    allPostes.removeWhere((element) => element.id == id);
    userPosts.removeWhere((element) => element.id == id);
    savedPostes.removeWhere((element) => element.id == id);
    box.remove("posts");
    savePost();
  }

  loadPosts() {
    if (box.hasData("posts")) {
      for (var element in box.read("posts")) {
        allPostes.add(PostModel.fromJson(element));
      }
    }
  }

  addToSaved({required String id}) {
    for (var element in allPostes) {
      if (id == element.id) {
        element.saved = !element.saved!;
        if (element.saved == true) {
          savedPostes.add(element);
          savePost();
        } else {
          savedPostes.remove(element);
          savePost();
        }
      }
    }
    GetIt.I.get<UserData>().users.first.savedPostes = savedPostes;
  }
}
