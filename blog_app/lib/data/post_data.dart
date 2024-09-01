import 'package:blog_app/data/user_data.dart';
import 'package:blog_app/models/post_model.dart';
import 'package:blog_app/services/setup.dart';
import 'package:get_it/get_it.dart';

class PostData {
  List<PostModel> allPostes = [
    PostModel(
        image: "assets/Image (1).png",
        id: "1",
        title: "Now Google’s Bard AI can talk & respond to visual prompts",
        summary:
            "Google is adding some new features to its Bard AI chatbot, including the ability for Bard to speak its answers to you and for it to respond to prompts that also include images. The chatbot is also now available in much of the world, including the EU.In a blog post, Google is positioning Bard’s spoken responses as a helpful way to “correct ",
        content:
            "The feature that lets you add images to prompts is something that Google first showed off at its I/O conference in May. In one example, Google suggested you could use this to ask for help writing a funny caption about a picture of two dogs. Google says the feature is now available in English and is expanding to new languages “soon.”Google is introducing a few other new features, too, including the ability to pin and rename conversations, share responses with your friends, and change the tone and style of the responses you get back from Bard.Google first opened up access to Bard in March, but at the time, it was available only in the US and the UK. The company has been rolling out the chatbot to many more countries since then, and that now includes “all countries in the EEA [European Economic Area] and Brazil,” Google spokesperson Jennifer Rodstrom tells The Verge. That expansion in Europe is a notable milestone; the company’s planned Bard launch in the EU was delayed due to privacy concerns.",
        category: "Technology",
        minutes: "2",
        date: "Jul 13, 2023",
        auther: "Kyle Barr",
        userAvatar: "assets/avatar_holder.png")
  ];
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

  editPost(
      {required String id,
      required String title,
      required String summary,
      required String content,
      required String category,
      required String minutes}) {
    for (var element in allPostes) {
      if (id == element.id) {
        element.title = title;
        element.summary = summary;
        element.content = content;
        element.category = category;
        element.minutes = minutes;
      }
    }
    savePost();
  }
}
