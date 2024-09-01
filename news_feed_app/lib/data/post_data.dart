

import 'package:news_feed_app/data/models/post_data_model.dart';

class PostData {
  final List<PostDataModel> postsList = [];

  PostData();

  void addNewPost({required PostDataModel newPost}) {
    postsList.add(newPost);
    //save
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
    }
  }

    void deletePost(int id) {
    postsList.removeWhere((post) => post.id == id);
    // save
  }

  
  // addTweet(PostDataModel value) {
  //   tweetsList.add(value);
  //   box.write("tweets", tweetsList);
  // }

  // removeTweet(int id) {
  //   tweetsList.removeWhere((tweet) => tweet.tweetId == id);
  // }

  // loadTweets() {
  //   if (box.hasData("tweets")) {
  //     for (var tweet in box.read("tweets")) {
  //       tweetsList.add(PostDataModel.fromJson(tweet));
  //     }
  //   }
  // }
}
