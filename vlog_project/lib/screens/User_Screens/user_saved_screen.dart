// import 'package:flutter/material.dart';
// import 'package:get_storage/get_storage.dart';
// import 'package:vlog_project/model/blog_model.dart';
// import 'package:vlog_project/screens/User_Screens/user_blog_page_screen.dart';
// import 'package:vlog_project/widget/user_card_view.dart';

// class UserSavedScreen extends StatelessWidget {
//   const UserSavedScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final box = GetStorage();
//     List<dynamic> savedBlogsJson = box.read('savedBlogs') ?? [];
//     List<Blog> savedBlogs =
//         savedBlogsJson.map((data) => Blog.fromJson(data)).toList();

//     return Scaffold(
//       backgroundColor: const Color(0xff111111),
//       appBar: AppBar(
//         backgroundColor: const Color(0xff1E1E1E),
//         title: const Text(
//           'Saved News',
//           style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
//         ),
//       ),
//       body: savedBlogs.isEmpty
//           ? const Center(
//               child: Text(
//                 'No saved blogs',
//                 style: TextStyle(color: Colors.white),
//               ),
//             )
//           : ListView.builder(
//               itemCount: savedBlogs.length,
//               itemBuilder: (context, index) {
//                 final blog = savedBlogs[index];
//                 return Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: UserCardView(
//                     title: blog.title,
//                     subtitle: blog.summary,
//                     date:
//                         "${blog.date.toLocal()} • ${blog.minutesToRead} min read",
//                     imagePath: blog.imageUrl,
//                     blog: blog,
//                     screentogo: UserBlogPage(blog: blog),
//                   ),
//                 );
//               },
//             ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vlog_project/model/blog_model.dart';
import 'package:vlog_project/screens/User_Screens/user_blog_page_screen.dart';
import 'package:vlog_project/widget/user_card_view.dart';

class UserSavedScreen extends StatefulWidget {
  const UserSavedScreen({Key? key}) : super(key: key);

  @override
  _UserSavedScreenState createState() => _UserSavedScreenState();
}

class _UserSavedScreenState extends State<UserSavedScreen> {
  final GetStorage box = GetStorage();
  late List<Blog> savedBlogs;

  @override
  void initState() {
    super.initState();
    _loadSavedBlogs();
  }

  void _loadSavedBlogs() {
    setState(() {
      List<dynamic> savedBlogsJson = box.read('savedBlogs') ?? [];
      savedBlogs = savedBlogsJson.map((data) => Blog.fromJson(data)).toList();
    });
  }

  void _deleteBlog(Blog blog) {
    setState(() {
      // Remove the blog from the savedBlogs list
      savedBlogs.remove(blog);

      // Save the updated list back to GetStorage
      box.write('savedBlogs', savedBlogs.map((b) => b.toJson()).toList());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff111111),
      appBar: AppBar(
        backgroundColor: const Color(0xff1E1E1E),
        title: const Text(
          'Saved Blogs',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: savedBlogs.isEmpty
          ? const Center(
              child: Text(
                'No saved blogs',
                style: TextStyle(color: Colors.white),
              ),
            )
          : ListView.builder(
              itemCount: savedBlogs.length,
              itemBuilder: (context, index) {
                final blog = savedBlogs[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: UserCardView(
                    blog: blog,
                    onDelete: () => _deleteBlog(blog),  // Delete blog when delete icon is clicked
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UserBlogPage(blog: blog),
                        ),
                      ).then((value) {
                        _loadSavedBlogs(); // Reload saved blogs when returning from detail view
                      });
                    },
                  ),
                );
              },
            ),
    );
  }
}
