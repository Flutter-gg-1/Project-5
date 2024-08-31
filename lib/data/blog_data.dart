import 'package:blog_app/data/mock_data.dart';
import 'package:get_storage/get_storage.dart';
import '../models/post.dart';
import '../models/user.dart';

class BlogData {
  List<Post> posts = mockPosts;
  List<User> users = mockUsers;
  User? loggedUser;
  final box = GetStorage();

  BlogData() {
    loadInfo();
  }

  addPost(Post post, User user) {
    posts.add(post);
    user.posts.add(post);
    savePost();
    saveUser();
  }

  deletePost({required Post post, required User user}) {
    posts.remove(post);
    user.posts.remove(post);
    savePost();
    saveUser();
  }

  updatePost(Post oldPost, Post newPost) {
    oldPost = newPost;
    savePost();
    saveUser();
  }

  addUser(User user) {
    users.add(user);
    saveUser();
  }

  saveLogin(User user) async {
    Map<String, dynamic> activeUser = {};
    activeUser = user.toJson();
    user.isLoggedIn = true;
    await box.write('logged', activeUser);
    saveUser();
  }

  savePost() async {
    List<Map<String, dynamic>> listOfPosts = [];
    for (var post in posts) {
      listOfPosts.add(post.toJson());
    }
    await box.write('posts', listOfPosts);
  }

  saveUser() async {
    List<Map<String, dynamic>> listOfUsers = [];
    for (var user in users) {
      listOfUsers.add(user.toJson());
    }
    await box.write('users', listOfUsers);
  }

  Future<void> loadInfo() async {
    List<Map<String, dynamic>> listOfPosts =
        List.from(await box.read('posts')).cast<Map<String, dynamic>>();
    List<Map<String, dynamic>> listOfUsers =
        List.from(await box.read('users')).cast<Map<String, dynamic>>();

    Map<String, dynamic>? activeUser = await box.read('logged');

    for (var post in listOfPosts) {
      posts.add(Post.fromJson(post));
    }
    for (var user in listOfUsers) {
      users.add(User.fromJson(user));
    }
    if (activeUser != null) {
      loggedUser = User.fromJson(activeUser);
    }
  }
}
