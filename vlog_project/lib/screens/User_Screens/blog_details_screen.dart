// import 'package:flutter/material.dart';
// import 'package:vlog_project/model/blog_model.dart';
// import 'package:vlog_project/helper/navigation.dart';
// import 'package:vlog_project/screens/User_Screens/edit_page_screen.dart';

// class UserBlogScreen extends StatelessWidget {
//   final Blog blog;

//   const UserBlogScreen({super.key, required this.blog});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xff111111),
//       appBar: AppBar(
//         backgroundColor: const Color(0xff111111),
//         leading: IconButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           icon: const Icon(
//             Icons.arrow_back_ios,
//             color: Colors.white,
//           ),
//         ),
//         actions: [
//           const Text(
//             "Aa",
//             style: TextStyle(color: Colors.white, fontSize: 18),
//           ),
//           const SizedBox(width: 5),
//           const Icon(
//             Icons.bookmark_border,
//             color: Colors.white,
//           ),
//           IconButton(
//             onPressed: () {
//               context.push(
//                 screen: EditPage(blog: blog),
//               );
//             },
//             icon: const Icon(
//               Icons.edit_outlined,
//               color: Colors.white,
//             ),
//           ),
//           const SizedBox(width: 10),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment:
//                 CrossAxisAlignment.start, // Aligns children to the left
//             children: [
//               Image.asset(
//                 blog.imageUrl,
//                 width: double.infinity,
//                 height: 340,
//                 fit: BoxFit.cover,
//               ),
//               const SizedBox(height: 20),
//               Row(
//                 children: [
//                   const Icon(
//                     Icons.line_axis_sharp,
//                     color: Color(0XffBDA6F5),
//                   ),
//                   const SizedBox(width: 8),
//                   Text(
//                     blog.category,
//                     style: const TextStyle(
//                       color: Color(0XffBDA6F5),
//                       fontWeight: FontWeight.bold,
//                       fontSize: 18,
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 20),
//               Text(
//                 blog.title,
//                 style: const TextStyle(
//                   color: Colors.white,
//                   fontWeight: FontWeight.bold,
//                   fontSize: 24,
//                 ),
//               ),
//               const SizedBox(height: 20),
//               const Row(
//                 children: [
//                   CircleAvatar(
//                     backgroundImage: AssetImage("assets/profile_page.png"),
//                     radius: 24,
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 10),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Text(
//                     "Author Name",
//                     style: TextStyle(color: Colors.grey),
//                   ),
//                   Text(
//                     "${blog.minutesToRead} min read • ${blog.date.toLocal()}",
//                     style: const TextStyle(color: Colors.grey),
//                   ),
//                   const SizedBox(height: 10),
//                   Image.asset("assets/social.png"),
//                 ],
//               ),
//               const SizedBox(height: 20),
//               const Text(
//                 "Summary",
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontWeight: FontWeight.bold,
//                   fontSize: 18,
//                 ),
//               ),
//               const SizedBox(height: 10),
//               Wrap(
//                 children: [
//                   Text(
//                     blog.summary,
//                     style: const TextStyle(color: Colors.grey),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 30),
//               const Text(
//                 "Content",
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontWeight: FontWeight.bold,
//                   fontSize: 18,
//                 ),
//               ),
//               const SizedBox(height: 20),
//               Wrap(
//                 children: [
//                   Text(
//                     blog.content,
//                     style: const TextStyle(color: Colors.grey),
//                   ),
//                 ],
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

class UserBlogScreen extends StatelessWidget {
  final Blog blog;

  const UserBlogScreen({Key? key, required this.blog}) : super(key: key);

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
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {
              // Navigate to the EditPage when the edit icon is pressed
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditPage(blog: blog),  // Pass the blog to be edited
                ),
              ).then((result) {
                if (result == true) {
                  // Handle the update, e.g., refresh the list or display a message
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Blog updated successfully!')),
                  );
                }
              });
            },
            icon: const Icon(Icons.edit_outlined, color: Colors.white),
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                blog.imageUrl.isNotEmpty ? blog.imageUrl : "assets/placeholder.png",
                width: double.infinity,
                height: 340,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  const Icon(
                    Icons.category,
                    color: Color(0XffBDA6F5),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    blog.category,
                    style: const TextStyle(
                      color: Color(0XffBDA6F5),
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                blog.title,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  const CircleAvatar(
                    backgroundImage: AssetImage("assets/profile_page.png"),
                    radius: 24,
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        blog.authorName,
                        style: const TextStyle(color: Colors.grey),
                      ),
                      Text(
                        "${blog.minutesToRead} min read • ${blog.date.toLocal()}",
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                "Summary",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
              const SizedBox(height: 10),
              Text(
                blog.summary,
                style: const TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 30),
              const Text(
                "Content",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
              const SizedBox(height: 20),
              Text(
                blog.content,
                style: const TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
