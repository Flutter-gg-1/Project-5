import 'package:blog_app/models/blog_model.dart';
import 'package:get_storage/get_storage.dart';

class BlogData {
  final box = GetStorage();
  final List<BlogModel> blogData = [
    BlogModel(
      title: "Now Google's Bard AI can talk & respond to visual prompts",
      summary:
          "Google is adding some new features to its Bard AI chatbot, including the ability for Bard to speak its answers to you and for it to respond to prompts that also include images. The chatbot is also now available in much of the world, including the EU. In a blog post, Google is positioning Bard’s spoken responses as a helpful way to “correct ",
      content:
          "The feature that lets you add images to prompts is something that Google first showed off at its I/O conference in May. In one example, Google suggested you could use this to ask for help writing a funny caption about a picture of two dogs. Google says the feature is now available in English and is expanding to new languages “soon.” Google is introducing a few other new features, too, including the ability to pin and rename conversations, share responses with your friends, and change the tone and style of the responses you get back from Bard. Google first opened up access to Bard in March, but at the time, it was available only in the US and the UK. The company has been rolling out the chatbot to many more countries since then, and that now includes “all countries in the EEA [European Economic Area] and Brazil,” Google spokesperson Jennifer Rodstrom tells The Verge. That expansion in Europe is a notable milestone; ",
      category: 'TECHNOLOGY',
      readingMinutes: '2 min read',
      image: 'assets/G.png',
      date: 'Jul 13, 2023',
      writer: 'Kyle Barr',
    ),
    BlogModel(
      title: 'WatchOS 10 preview: widgets all the way down',
      summary:
          "Google is adding some new features to its Bard AI chatbot, including the ability for Bard to speak its answers to you and for it to respond to prompts that also include images. The chatbot is also now available in much of the world, including the EU. In a blog post, Google is positioning Bard’s spoken responses as a helpful way to “correct ",
      content:
          "The feature that lets you add images to prompts is something that Google first showed off at its I/O conference in May. In one example, Google suggested you could use this to ask for help writing a funny caption about a picture of two dogs. Google says the feature is now available in English and is expanding to new languages “soon.” Google is introducing a few other new features, too, including the ability to pin and rename conversations, share responses with your friends, and change the tone and style of the responses you get back from Bard. Google first opened up access to Bard in March, but at the time, it was available only in the US and the UK. The company has been rolling out the chatbot to many more countries since then, and that now includes “all countries in the EEA [European Economic Area] and Brazil,” Google spokesperson Jennifer Rodstrom tells The Verge. That expansion in Europe is a notable milestone; ",
      category: 'TECHNOLOGY',
      readingMinutes: '4 min read',
      image: 'assets/WatchOS.png',
      date: 'Jul 10, 2023',
      writer: 'Jeremy Morgan',
    ),
    BlogModel(
      title: "How Gen Z are disrupting the definition of 'prestigious' jobs",
      summary:
          "Google is adding some new features to its Bard AI chatbot, including the ability for Bard to speak its answers to you and for it to respond to prompts that also include images. The chatbot is also now available in much of the world, including the EU. In a blog post, Google is positioning Bard’s spoken responses as a helpful way to “correct ",
      content:
          "The feature that lets you add images to prompts is something that Google first showed off at its I/O conference in May. In one example, Google suggested you could use this to ask for help writing a funny caption about a picture of two dogs. Google says the feature is now available in English and is expanding to new languages “soon.” Google is introducing a few other new features, too, including the ability to pin and rename conversations, share responses with your friends, and change the tone and style of the responses you get back from Bard. Google first opened up access to Bard in March, but at the time, it was available only in the US and the UK. The company has been rolling out the chatbot to many more countries since then, and that now includes “all countries in the EEA [European Economic Area] and Brazil,” Google spokesperson Jennifer Rodstrom tells The Verge. That expansion in Europe is a notable milestone; ",
      category: 'TECHNOLOGY',
      readingMinutes: '6 min read',
      image: 'assets/GenZ.png',
      date: 'Jul 20, 2023',
      writer: 'Amber Israelsen',
    ),
  ];
  BlogData() {
    loadNews();
  }

  void addNewNews({required BlogModel news}) {
    blogData.add(news);
    saveNews();
  }

  Future<void> saveNews() async {
    List<Map<String, dynamic>> newsAsMap =
        blogData.map((e) => e.toJson()).toList();
    await box.write("blogData", newsAsMap);
  }

  void loadNews() {
    if (box.hasData('blogData')) {
      List<Map<String, dynamic>> newsSaved =
          List.from(box.read('blogData')).cast<Map<String, dynamic>>();
      blogData.clear();
      for (var element in newsSaved) {
        blogData.add(BlogModel.fromJson(element));
      }
    }
  }

  Future<void> refreshBlogs() async {
    loadNews();
  }

  Future<void> updateBlog(BlogModel updatedBlog) async {
    final index =
        blogData.indexWhere((blog) => blog.title == updatedBlog.title);
    if (index != -1) {
      blogData[index] = updatedBlog;
      await saveNews();
    }
  }

  Future<void> removeBlog(BlogModel blogToRemove) async {
    blogData.removeWhere((blog) => blog.title == blogToRemove.title);
    await saveNews();
  }
}
