import 'package:blog_app/models/blog.dart';
import 'package:blog_app/models/user.dart';

class AppData {
  User user = User(
      username: "turki",
      password: "turki",
      title: "Software engineer",
      blogs: []);
  List<Blog> savedBlogs = [];
  bool loggedIn = false;
  List<Blog> blogs = [
    Blog.create(
      category: 'Technology',
      title: 'The Rise of AI in Everyday Life',
      summary:
          'An exploration of how AI is being integrated into daily routines.',
      content:
          'Artificial Intelligence (AI) is becoming increasingly prevalent in various aspects of our lives...',
      image: 'assets/home/watch.png',
      author: User(
          username: "turki",
          password: "turki",
          title: "Software engineer",
          blogs: []),
    ),
    Blog.create(
      category: 'Technology',
      title: 'The Rise of AI in Everyday Life',
      summary:
          'An exploration of how AI is being integrated into daily routines.',
      content:
          'Artificial Intelligence (AI) is becoming increasingly prevalent in various aspects of our lives...',
      image: 'assets/home/business_man.png',
      author: User(
          username: "turki",
          password: "turki",
          title: "Software engineer",
          blogs: []),
    )
  ];

  createBlog({
    required String category,
    required String title,
    required String summary,
    required String content,
    required String image,
    required String authorName,
  }) {
    Blog blog = Blog.create(
        author: User(
            username: "turki",
            password: "turki",
            title: "Software engineer",
            blogs: []),
        category: category,
        content: content,
        title: title,
        image: image,
        summary: summary);
    blogs.add(blog);
  }

  // void updateBlog(Blog blog) {
  //   for (var blog in b) {
      
  //   }
  // }
}
