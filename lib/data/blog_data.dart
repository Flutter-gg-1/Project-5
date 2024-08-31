import 'package:blog_app/data/user_data.dart';
import 'package:blog_app/models/blog.dart';
import 'package:get_it/get_it.dart';

class BlogData {

  List<Blog> blogs = [
    Blog.create(
      category: 'Technology',
      title: 'The Rise of AI in Everyday Life',
      summary:
          'An exploration of how AI is being integrated into daily routines.',
      content:
          'Artificial Intelligence (AI) is becoming increasingly prevalent in various aspects of our lives...',
      image: 'assets/home/watch.png',
      author: GetIt.I.get<UserData>().user
    ),
    Blog.create(
      category: 'TECHNOLOGY',
      title: 'The Rise of AI in Everyday Life',
      summary:
          'An exploration of how AI is being integrated into daily routines.',
      content:
          'Artificial Intelligence (AI) is becoming increasingly prevalent in various aspects of our lives...',
      image: 'assets/home/business_man.png',
      author: GetIt.I.get<UserData>().user
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
      author: GetIt.I.get<UserData>().user,
        category: category,
        content: content,
        title: title,
        image: image,
        summary: summary);
    blogs.add(blog);
    GetIt.I.get<UserData>().user.blogs.add(blog);
  }
}
