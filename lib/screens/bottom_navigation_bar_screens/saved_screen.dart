import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:project5/model/blog_data_model.dart';
import 'package:project5/widgets/custom_top_stories.dart';
import '../../data_layer/blog_data.dart';
import '../../widgets/custom_text/custom_text.dart';

class SavedScreen extends StatefulWidget {
  const SavedScreen({super.key});

  @override
  State<SavedScreen> createState() => _SavedScreenState();
}

class _SavedScreenState extends State<SavedScreen> {
  @override
  Widget build(BuildContext context) {
    final blogData = GetIt.I.get<BlogData>();
    final List<BlogDataModel> savedBlogs = blogData.getSavedBlog(); 

    return Scaffold(
      backgroundColor: const Color(0xff111111),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(30),
              child: CustomText(
                text: "Saved News",
                color: Colors.white,
                size: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            if (savedBlogs.isEmpty)
              const Padding(
                padding: EdgeInsets.only(top: 300),
                child: Center(
                  child: CustomText(
                    text: "No news found",
                    color: Color(0xffB8B8B8),
                    size: 20,
                  ),
                ),
              )
            else
              Expanded(
                child: ListView.builder(
                  itemCount: savedBlogs.length,
                  itemBuilder: (context, index) {
                    final blog = savedBlogs[index];
                    return CustomTopStories(
                      image: Image.asset("assets/google_small.png"),
                      title: blog.title,
                      subtitle: blog.authorName,
                      text: "${blog.date.toLocal()} • ${blog.minutesToRead} min Read",
                      id: blog.id, isSave: blog.isSaved, onPressed: () {
                          GetIt.I.get<BlogData>().changeSaveState(id: blog.id);
                          if(blog.isSaved == false){
                          GetIt.I.get<BlogData>().removeSavedBlog();
                        }
                        setState(() {
                            
                          });
                      },
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
