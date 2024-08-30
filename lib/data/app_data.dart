import 'package:blog_app/models/blog.dart';
import 'package:blog_app/models/user.dart';

class AppData {
  List<Blog> blogs = [];
  List<User> users = [];

  Blog blog1 = Blog.create(
    category: 'Technology',
    title: 'The Rise of AI in Everyday Life',
    summary:
        'An exploration of how AI is being integrated into daily routines.',
    content:
        'Artificial Intelligence (AI) is becoming increasingly prevalent in various aspects of our lives...',
    image: 'https://example.com/ai.jpg',
    authorName: "loggedInUser",
  );

  Blog blog2 = Blog.create(
    category: 'Health',
    title: '10 Tips for a Healthier Lifestyle',
    summary: 'Simple but effective tips to improve your overall health.',
    content:
        'Living a healthy lifestyle doesn’t have to be complicated. Here are ten simple tips...',
    image: 'https://example.com/health.jpg',
    authorName: "loggedInUser",
  );
  createBlog({
    required String category,
    required String title,
    required String summary,
    required String content,
    required String image,
    required String authorName,
  }) {
    Blog blog =  Blog.create(
        authorName: authorName,
        category: category,
        content: content,
        title: title,
        image: image,
        summary: summary);
  blogs.add(blog);
  }
}
