import 'package:project5/models/post.dart';

class AllPosts {
  // list of posts categories
  final List<String> categories = ['Tech', 'AI', 'Cloud', 'Robotics', 'IoT'];
  
  // map of carousel images of each category
  final Map<String,List<String>> carouselMap = {
    'Tech' : ['assets/drone.png','assets/drone.png','assets/drone.png',],
    'AI' : ['assets/drone.png','assets/drone.png','assets/drone.png',],
    'Cloud' : ['assets/drone.png','assets/drone.png','assets/drone.png',],
    'Robotics' : ['assets/drone.png','assets/drone.png','assets/drone.png',],
    'IoT' : ['assets/drone.png','assets/drone.png','assets/drone.png',],
  };

  // posts data
  final List<Post> posts = [
    // Tech
    Post(
        category: 'Tech',
        authorName: 'Kyle Barr',
        title: 'Now Google’s Bard AI can talk & respond to visual prompts',
        summary:
            """Google is adding some new features to its Bard AI chatbot, including the ability for Bard to speak its answers to you and for it to respond to prompts that also include images. The chatbot is also now available in much of the world, including the EU.
In a blog post, Google is positioning Bard’s spoken responses as a helpful way to “correct """,
        content: """
The feature that lets you add images to prompts is something that Google first showed off at its I/O conference in May. In one example, Google suggested you could use this to ask for help writing a funny caption about a picture of two dogs. Google says the feature is now available in English and is expanding to new languages “soon.”
Google is introducing a few other new features, too, including the ability to pin and rename conversations, share responses with your friends, and change the tone and style of the responses you get back from Bard.
Google first opened up access to Bard in March, but at the time, it was available only in the US and the UK. The company has been rolling out the chatbot to many more countries since then, and that now includes “all countries in the EEA [European Economic Area] and Brazil,” Google spokesperson Jennifer Rodstrom tells The Verge. That expansion in Europe is a notable milestone; the company’s planned Bard launch in the EU was delayed due to privacy concerns.""",
        date: 'Jul 13, 2023 ',
        minutesToRead: 2,
        postImage: 'assets/google.png',
        isSaved: false
    ),
    Post(
        category: 'Tech',
        authorName: 'Jeremy Morgan',
        title: 'WatchOS 10 preview: widgets all the way down',
        summary:
            """Google is adding some new features to its Bard AI chatbot, including the ability for Bard to speak its answers to you and for it to respond to prompts that also include images. The chatbot is also now available in much of the world, including the EU.
In a blog post, Google is positioning Bard’s spoken responses as a helpful way to “correct """,
        content: """
The feature that lets you add images to prompts is something that Google first showed off at its I/O conference in May. In one example, Google suggested you could use this to ask for help writing a funny caption about a picture of two dogs. Google says the feature is now available in English and is expanding to new languages “soon.”
Google is introducing a few other new features, too, including the ability to pin and rename conversations, share responses with your friends, and change the tone and style of the responses you get back from Bard.
Google first opened up access to Bard in March, but at the time, it was available only in the US and the UK. The company has been rolling out the chatbot to many more countries since then, and that now includes “all countries in the EEA [European Economic Area] and Brazil,” Google spokesperson Jennifer Rodstrom tells The Verge. That expansion in Europe is a notable milestone; the company’s planned Bard launch in the EU was delayed due to privacy concerns.""",
        date: 'Jul 10, 2023 ',
        minutesToRead: 4,
        postImage: 'assets/watch.png',
        isSaved: false
    ),
    Post(
        category: 'Tech',
        authorName: 'Amber Israelsen',
        title: 'How Gen Z are disrupting the definition of ‘prestigious’ jobs',
        summary:
            """Google is adding some new features to its Bard AI chatbot, including the ability for Bard to speak its answers to you and for it to respond to prompts that also include images. The chatbot is also now available in much of the world, including the EU.
In a blog post, Google is positioning Bard’s spoken responses as a helpful way to “correct """,
        content: """
The feature that lets you add images to prompts is something that Google first showed off at its I/O conference in May. In one example, Google suggested you could use this to ask for help writing a funny caption about a picture of two dogs. Google says the feature is now available in English and is expanding to new languages “soon.”
Google is introducing a few other new features, too, including the ability to pin and rename conversations, share responses with your friends, and change the tone and style of the responses you get back from Bard.
Google first opened up access to Bard in March, but at the time, it was available only in the US and the UK. The company has been rolling out the chatbot to many more countries since then, and that now includes “all countries in the EEA [European Economic Area] and Brazil,” Google spokesperson Jennifer Rodstrom tells The Verge. That expansion in Europe is a notable milestone; the company’s planned Bard launch in the EU was delayed due to privacy concerns.""",
        date: 'Jul 10, 2023 ',
        minutesToRead: 2,
        postImage: 'assets/man.png',
        isSaved: false
    ),
    Post(
        category: 'Tech',
        authorName: 'John Smith',
        title: 'Technology Evolution',
        summary:
            """Google is adding some new features to its Bard AI chatbot, including the ability for Bard to speak its answers to you and for it to respond to prompts that also include images. The chatbot is also now available in much of the world, including the EU.
In a blog post, Google is positioning Bard’s spoken responses as a helpful way to “correct """,
        content: """
The feature that lets you add images to prompts is something that Google first showed off at its I/O conference in May. In one example, Google suggested you could use this to ask for help writing a funny caption about a picture of two dogs. Google says the feature is now available in English and is expanding to new languages “soon.”
Google is introducing a few other new features, too, including the ability to pin and rename conversations, share responses with your friends, and change the tone and style of the responses you get back from Bard.
Google first opened up access to Bard in March, but at the time, it was available only in the US and the UK. The company has been rolling out the chatbot to many more countries since then, and that now includes “all countries in the EEA [European Economic Area] and Brazil,” Google spokesperson Jennifer Rodstrom tells The Verge. That expansion in Europe is a notable milestone; the company’s planned Bard launch in the EU was delayed due to privacy concerns.""",
        date: 'Jul 10, 2023 ',
        minutesToRead: 5,
        postImage: 'assets/tech.png',
        isSaved: false
    ),
    // AI
    Post(
        category: 'AI',
        authorName: 'Jenna Wick',
        title: 'Robots in our life',
        summary:
            """Google is adding some new features to its Bard AI chatbot, including the ability for Bard to speak its answers to you and for it to respond to prompts that also include images. The chatbot is also now available in much of the world, including the EU.
In a blog post, Google is positioning Bard’s spoken responses as a helpful way to “correct """,
        content: """
The feature that lets you add images to prompts is something that Google first showed off at its I/O conference in May. In one example, Google suggested you could use this to ask for help writing a funny caption about a picture of two dogs. Google says the feature is now available in English and is expanding to new languages “soon.”
Google is introducing a few other new features, too, including the ability to pin and rename conversations, share responses with your friends, and change the tone and style of the responses you get back from Bard.
Google first opened up access to Bard in March, but at the time, it was available only in the US and the UK. The company has been rolling out the chatbot to many more countries since then, and that now includes “all countries in the EEA [European Economic Area] and Brazil,” Google spokesperson Jennifer Rodstrom tells The Verge. That expansion in Europe is a notable milestone; the company’s planned Bard launch in the EU was delayed due to privacy concerns.""",
        date: 'Jul 10, 2023 ',
        minutesToRead: 5,
        postImage: 'assets/robot.png',
        isSaved: false
    ),
    // Cloud
    Post(
    
        category: 'Cloud',
        authorName: 'Cloudy Cloud',
        title: 'Cloud Computing Services',
        summary:
            """Google is adding some new features to its Bard AI chatbot, including the ability for Bard to speak its answers to you and for it to respond to prompts that also include images. The chatbot is also now available in much of the world, including the EU.
In a blog post, Google is positioning Bard’s spoken responses as a helpful way to “correct """,
        content: """
The feature that lets you add images to prompts is something that Google first showed off at its I/O conference in May. In one example, Google suggested you could use this to ask for help writing a funny caption about a picture of two dogs. Google says the feature is now available in English and is expanding to new languages “soon.”
Google is introducing a few other new features, too, including the ability to pin and rename conversations, share responses with your friends, and change the tone and style of the responses you get back from Bard.
Google first opened up access to Bard in March, but at the time, it was available only in the US and the UK. The company has been rolling out the chatbot to many more countries since then, and that now includes “all countries in the EEA [European Economic Area] and Brazil,” Google spokesperson Jennifer Rodstrom tells The Verge. That expansion in Europe is a notable milestone; the company’s planned Bard launch in the EU was delayed due to privacy concerns.""",
        date: 'Jul 10, 2023 ',
        minutesToRead: 3,
        postImage: 'assets/cloud.png',
        isSaved: false
    ),
    // Robotics
    Post(
        category: 'Robotics',
        authorName: 'Robo robo',
        title: 'Robotics Programming and manifacturing',
        summary:
            """Google is adding some new features to its Bard AI chatbot, including the ability for Bard to speak its answers to you and for it to respond to prompts that also include images. The chatbot is also now available in much of the world, including the EU.
In a blog post, Google is positioning Bard’s spoken responses as a helpful way to “correct """,
        content: """
The feature that lets you add images to prompts is something that Google first showed off at its I/O conference in May. In one example, Google suggested you could use this to ask for help writing a funny caption about a picture of two dogs. Google says the feature is now available in English and is expanding to new languages “soon.”
Google is introducing a few other new features, too, including the ability to pin and rename conversations, share responses with your friends, and change the tone and style of the responses you get back from Bard.
Google first opened up access to Bard in March, but at the time, it was available only in the US and the UK. The company has been rolling out the chatbot to many more countries since then, and that now includes “all countries in the EEA [European Economic Area] and Brazil,” Google spokesperson Jennifer Rodstrom tells The Verge. That expansion in Europe is a notable milestone; the company’s planned Bard launch in the EU was delayed due to privacy concerns.""",
        date: 'Jul 10, 2023 ',
        minutesToRead: 3,
        postImage: 'assets/robot2.png',
        isSaved: false
    ),
    // IoT
    Post(
        category: 'IoT',
        authorName: 'Ralph Pete',
        title: 'Internet of things',
        summary:
            """Google is adding some new features to its Bard AI chatbot, including the ability for Bard to speak its answers to you and for it to respond to prompts that also include images. The chatbot is also now available in much of the world, including the EU.
In a blog post, Google is positioning Bard’s spoken responses as a helpful way to “correct """,
        content: """
The feature that lets you add images to prompts is something that Google first showed off at its I/O conference in May. In one example, Google suggested you could use this to ask for help writing a funny caption about a picture of two dogs. Google says the feature is now available in English and is expanding to new languages “soon.”
Google is introducing a few other new features, too, including the ability to pin and rename conversations, share responses with your friends, and change the tone and style of the responses you get back from Bard.
Google first opened up access to Bard in March, but at the time, it was available only in the US and the UK. The company has been rolling out the chatbot to many more countries since then, and that now includes “all countries in the EEA [European Economic Area] and Brazil,” Google spokesperson Jennifer Rodstrom tells The Verge. That expansion in Europe is a notable milestone; the company’s planned Bard launch in the EU was delayed due to privacy concerns.""",
        date: 'Jul 10, 2023 ',
        minutesToRead: 2,
        postImage: 'assets/iot.png',
        isSaved: false
    ),
  ];


  getCarousel({required String category}) {
    return carouselMap[category];
  }

  editPost({required Post post, required String newTitle, required String newSummary, required String newContent}) {
    post.title = newTitle;
    post.summary = newSummary;
    post.content = newContent;
  }

  addPost({required Post post}) {
    posts.add(post);
  }

  searchPost({required String searchTerm}) {
    return posts.where((post)=>post.title.toLowerCase().contains(searchTerm.toLowerCase())).toList();
  }
}