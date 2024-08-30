import '../models/post.dart';
import '../models/user.dart';

class PostData {
  Map<String, List<Post>> posts = {
    'Tech':[
      Post.fromJson({
       'title': 'title',
      'summary': 'summary',
      'content': 'content',
      'category': 'category',
      'readingMinutes': 2,
      'author': {
        
      }
      }),
      Post.fromJson({
       'title': 'title',
      'summary': 'summary',
      'content': 'content',
      'category': 'category',
      'readingMinutes': 2,
      }),
      Post.fromJson({
       'title': 'title',
      'summary': 'summary',
      'content': 'content',
      'category': 'category',
      'readingMinutes': 2,
      }),
      Post.fromJson({
       'title': 'title',
      'summary': 'summary',
      'content': 'content',
      'category': 'category',
      'readingMinutes': 2,
      }),
      Post.fromJson({
       'title': 'title',
      'summary': 'summary',
      'content': 'content',
      'category': 'category',
      'readingMinutes': 2,
      }),
      Post.fromJson({
       'title': 'title',
      'summary': 'summary',
      'content': 'content',
      'category': 'category',
      'readingMinutes': 2,
      }),
    ]
  };
}
