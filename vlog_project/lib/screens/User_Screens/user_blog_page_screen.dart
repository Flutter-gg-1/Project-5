// import 'package:flutter/material.dart';
// import 'package:vlog_project/model/blog_model.dart';

// class UserBlogPage extends StatelessWidget {
//   final Blog blog;

//   const UserBlogPage({Key? key, required this.blog}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(blog.title),
//         backgroundColor: const Color(0xff111111),
//       ),
//       backgroundColor: const Color(0xff111111),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               if (blog.imageUrl.isNotEmpty)
//                 Image.asset(
//                   blog.imageUrl,
//                   width: double.infinity,
//                   fit: BoxFit.cover,
//                 ),
//               const SizedBox(height: 20),
//               Text(
//                 blog.title,
//                 style: const TextStyle(
//                   color: Colors.white,
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               const SizedBox(height: 10),
//               Text(
//                 blog.summary,
//                 style: const TextStyle(color: Colors.grey, fontSize: 18),
//               ),
//               const SizedBox(height: 20),
//               Text(
//                 blog.content,
//                 style: const TextStyle(color: Colors.white, fontSize: 16),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:vlog_project/model/blog_model.dart';
import 'package:vlog_project/screens/User_Screens/edit_page_screen.dart';

class UserBlogPage extends StatelessWidget {
  final Blog blog;

  const UserBlogPage({Key? key, required this.blog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff111111),
      appBar: AppBar(
        backgroundColor: const Color(0xff111111),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditPage(blog: blog),
                ),
              ).then((result) {
                if (result == true) {
                  // Handle the update, e.g., refresh the list or display a message
                  // Since this is a stateless widget, you'd need to rebuild the whole page
                  // or use a state management solution like setState in the parent widget.
                }
              });
            },
            icon: const Icon(Icons.edit_outlined, color: Colors.white),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (blog.imageUrl.isNotEmpty)
                Image.asset(
                  blog.imageUrl,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              const SizedBox(height: 20),
              Text(
                blog.title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                blog.summary,
                style: const TextStyle(color: Colors.grey, fontSize: 18),
              ),
              const SizedBox(height: 20),
              Text(
                blog.content,
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
