import 'package:blog_nest/model/enum/blog_category.dart';

class Blog {
  int id;
  String title;
  String summary;
  String content;
  BlogCategory category;
  int readingMinutes;
  String timeStamp;
  String imgData;
  int authorId;

  Blog({
    required this.id,
    required this.title,
    required this.summary,
    required this.content,
    required this.category,
    required this.readingMinutes,
    required this.timeStamp,
    required this.imgData,
    required this.authorId,
  });

  factory Blog.fromJson(Map<String, dynamic> json) {
    return Blog(
      id: json['id'],
      title: json['title'],
      summary: json['summary'],
      content: json['content'],
      category: json['category'],
      readingMinutes: json['readingMinutes'],
      timeStamp: json['timeStamp'],
      imgData: json['imgData'],
      authorId: json['authorId'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'category': category,
        'timeStamp': timeStamp,
        'imgData': imgData,
        'authorId': authorId,
      };

  static var defaultBlogs = [
    Blog(
        id: 1,
        title:
            'Now Google’s Bard AI Chatbot can talk & respond to visual prompts!',
        summary:
            'Google is adding some new features to its Bard AI chatbot, including the ability for Bard to speak its answers to you and for it to respond to prompts that also include images. The chatbot is also now available in much of the world, including the EU.In a blog post, Google is positioning Bard’s spoken responses as a helpful way to “correct',
        content:
            'The feature that lets you add images to prompts is something that Google first showed off at its I/O conference in May. In one example, Google suggested you could use this to ask for help writing a funny caption about a picture of two dogs. Google says the feature is now available in English and is expanding to new languages “soon.”Google is introducing a few other new features, too, including the ability to pin and rename conversations, share responses with your friends, and change the tone and style of the responses you get back from Bard.Google first opened up access to Bard in March, but at the time, it was available only in the US and the UK. The company has been rolling out the chatbot to many more countries since then, and that now includes “all countries in the EEA [European Economic Area] and Brazil,” Google spokesperson Jennifer Rodstrom tells The Verge. That expansion in Europe is a notable milestone; the company’s planned Bard launch in the EU was delayed due to privacy concerns.',
        category: BlogCategory.iot,
        readingMinutes: 2,
        timeStamp: 'Jul 13, 2023',
        imgData: '',
        authorId: 1),
    Blog(
        id: 2,
        title: '',
        summary: '',
        content: '',
        category: BlogCategory.iot,
        readingMinutes: 5,
        timeStamp: '',
        imgData: '',
        authorId: 1),
    Blog(
        id: 3,
        title: '',
        summary: '',
        content: '',
        category: BlogCategory.robotics,
        readingMinutes: 3,
        timeStamp: '',
        imgData: '',
        authorId: 2),
  ];
}
