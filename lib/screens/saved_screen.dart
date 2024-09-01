import 'package:blog_app/data_layer/user_data.dart';
import 'package:blog_app/helper/extension/color_ext.dart';
import 'package:blog_app/helper/extension/nav.dart';
import 'package:blog_app/screens/news_screen.dart';
import 'package:blog_app/widgets/cards/top_stories_card.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';

class SavedScreen extends StatefulWidget {
  const SavedScreen({super.key});

  @override
  State<SavedScreen> createState() => _SavedScreenState();
}

class _SavedScreenState extends State<SavedScreen> {
  late UserData userData;

  @override
  void initState() {
    super.initState();
    userData = GetIt.I.get<UserData>();
    if (userData.currentUser != null) {
      userData.loadSavedBlogs();
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentUser = userData.currentUser;

    return Scaffold(
      backgroundColor: ColorExt.background,
      appBar: AppBar(
        backgroundColor: ColorExt.leaden,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Expanded(
              child: Text(
                "Saved News",
                style: GoogleFonts.inter(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: ColorExt.white,
                ),
              ),
            ),
          ],
        ),
      ),
      body: currentUser == null
          ? Center(
              child: Text(
                'Login first',
                style: GoogleFonts.inter(
                  fontSize: 16,
                  color: ColorExt.grey,
                ),
              ),
            )
          : currentUser.savedBlogs.isEmpty
              ? Center(
                  child: Text(
                    'No news found',
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      color: ColorExt.grey,
                    ),
                  ),
                )
              : ListView.builder(
                  itemCount: currentUser.savedBlogs.length,
                  itemBuilder: (context, index) {
                    final blog = currentUser.savedBlogs[index];
                    return TopStoriesCard(
                      writer: blog.writer,
                      title: blog.title,
                      image: blog.image,
                      date: blog.date,
                      blog: blog,
                      onSave: () {
                        setState(() {
                          userData.removeBlog(blog);
                        });
                      },
                      onTap: () {
                        context.push(
                          screen: FullNewsScreen(
                            blog: blog,
                          ),
                        );
                      },
                    );
                  },
                ),
    );
  }
}
