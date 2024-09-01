import 'package:blog_app_project/model/blog_model.dart';

class BlogData {
  final List<BlogModel> blogList = [];
  //final box = GetStorage();

  // BlogData() {
  //   //loadTweets();
  // }

  addBlog(BlogModel value) {
    blogList.add(value);
    //box.write("tweets", tweetsList);
  }

  updateBlog(BlogModel value) {
    blogList.add(value);
    //box.write("tweets", tweetsList);
  }

  // removeBlog(int id) {
  //   blogList.removeWhere((tweet) => tweet.id == id);
  // }
  removeBlog({required int id}) {
    blogList.removeAt(id);
    //saveTweet();
  }
  // loadTweets() {
  //   if (box.hasData("tweets")) {
  //     for (var tweet in box.read("tweets")) {
  //       tweetsList.add(TweetsModel.fromJson(tweet));
  //     }
  //   }
  // }
}
