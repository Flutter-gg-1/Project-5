import 'package:blog_app/models/blog.dart';
import 'package:blog_app/models/user.dart';

class AppData {
  User user = User(
      username: "turki",
      password: "turki",
      title: "Software engineer",
      blogs: []);
  bool loggedIn = false;

  // Blog blog1 = Blog.create(
  //   category: 'Technology',
  //   title: 'The Rise of AI in Everyday Life',
  //   summary:
  //       'An exploration of how AI is being integrated into daily routines.',
  //   content:
  //       'Artificial Intelligence (AI) is becoming increasingly prevalent in various aspects of our lives...',
  //   image: 'https://example.com/ai.jpg',
  //   authorName: "loggedInUser",
  // );

  // Blog blog2 = Blog.create(
  //   category: 'Health',
  //   title: '10 Tips for a Healthier Lifestyle',
  //   summary: 'Simple but effective tips to improve your overall health.',
  //   content:
  //       'Living a healthy lifestyle doesn’t have to be complicated. Here are ten simple tips...',
  //   image: 'https://example.com/health.jpg',
  //   authorName: "loggedInUser",
  // );

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
}
