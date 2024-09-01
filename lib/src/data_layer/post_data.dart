import 'package:get_storage/get_storage.dart';
import 'package:project_5/src/models/post_models.dart';

class PostData {
  List<PostModel> allPost = [
    PostModel(
        id: 1,
        // idUser: 5,
        title:
            'Now Google’s Bard AI Chatbot can talk & respond to visual prompts!',
        summary:
            'Google is adding some new features to its Bard AI chatbot, including the ability for Bard to speak its answers to you and for it to respond to prompts that also include images. The chatbot is also now available in much of the world, including the EU.In a blog post, Google is positioning Bard’s spoken responses as a helpful way to “correct',
        content:
            'The feature that lets you add images to prompts is something that Google first showed off at its I/O conference in May. In one example, Google suggested you could use this to ask for help writing a funny caption about a picture of two dogs. Google says the feature is now available in English and is expanding to new languages “soon.”Google is introducing a few other new features, too, including the ability to pin and rename conversations, share responses with your friends, and change the tone and style of the responses you get back from Bard.Google first opened up access to Bard in March, but at the time, it was available only in the US and the UK. The company has been rolling out the chatbot to many more countries since then, and that now includes “all countries in the EEA',
        image: 'assets/G.png',
        category: 'tec',
        readingMinutes: "15",
        username: 'rawan',
        creationDate: DateTime.now()),
    PostModel(
        id: 2,
        // idUser: 1,
        username: 'mjd',
        title: 'watchOS 10 preview: widgets all the way down',
        summary:
            'As to why Apple up and decided to change things, the short answer is widgets',
        content:
            'This concept isn’t unique to the Apple Watch. Wear OS watches have had Tiles for ages, and they essentially do the same thing. The main difference functionally is it’s much easier to cycle through every single widget on the Apple Watch. They’re more space-efficient, and it’s faster to scroll vertically than horizontally, as Wear OS has you do. The other thing Apple has is the Smart Stack. What’s “smart” about it is that in the list of widgets you’ve just built, watchOS 10 will use machine learning to surface the most relevant widgets first based on contextual clues. So Weather and News might pop up first in the morning, while Calendar might take that top slot in the hour before your next meeting. It’s subtle, and sometimes the AI doesn’t get it right — but you can flip through the widgets fast enough that it’s not a glaring problem.',
        image: 'assets/watch.png',
        category: 'tec',
        readingMinutes: "15",
        creationDate: DateTime.now())
  ];

  List<String> categories = [];
  final box = GetStorage();

  PostData() {
    print('PostData con : ${allPost.length}');
    loadPost();
  }

  // changeStateTask({
  //   required int id,
  // }) {
  //   for (var element in allPost) {
  //     if (element.id == id) {
  //       element.completed = !element.completed!;
  //     }
  //   }
  // }
  // //?--------- add new category

  addNewCategory({required String nameCategory}) {
    categories.add(nameCategory);
    saveCategory();
  }

  //?--------- add new tasks
  addNewPost({required PostModel newPost}) {
    allPost.add(newPost);
    print('addNewPost fun : ${allPost.length}');
    savePost();
  }

  //?--------- save all tasks
  savePost() async {
    try {
      List<Map<String, dynamic>> postAsMap = [];
      for (var element in allPost) {
        postAsMap.add(element.toJson());
      }
      await box.write("post", postAsMap);
    } catch (e) {
      print(e);
    }
  }

  //?--------- save all category
  saveCategory() async {
    await box.write("category", categories);
  }

  //?--------- load all data tasks ands categories

  loadPost() {
    if (box.hasData('category')) {
      categories = List.from(box.read("category")).cast<String>();
      categories = box.read("category") as List<String>;
    }
    if (box.hasData('post')) {
      List<Map<String, dynamic>> postSaved =
          List.from(box.read('post')).cast<Map<String, dynamic>>();
      for (var element in postSaved) {
        allPost.add(PostModel.fromJson(element));
      }
    }
    // box.erase();
  }
}
