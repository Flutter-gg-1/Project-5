// // lib/widget/blog_details_page.dart

// import 'package:flutter/material.dart';
// import 'package:vlog_project/model/blog_model.dart';

// class BlogDetailsPage extends StatelessWidget {
//   final Blog blog;

//   const BlogDetailsPage({Key? key, required this.blog}) : super(key: key);

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
//           icon: const Icon(Icons.arrow_back_ios),
//           color: Colors.white,
//         ),
//         actions: const [
//           Text(
//             "Aa",
//             style: TextStyle(color: Colors.white, fontSize: 18),
//           ),
//           SizedBox(width: 5),
//           Icon(
//             Icons.bookmark_border,
//             color: Colors.white,
//           ),
//           SizedBox(width: 10),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Display the main blog image
//               Image.asset(
//                 blog.postImage.isNotEmpty ? blog.postImage : 'assets/default_image.png',
//                 width: double.infinity,
//                 height: 340,
//                 fit: BoxFit.cover,
//               ),
//               const SizedBox(height: 20),
//               // Display the category
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
//               // Display the title
//               Text(
//                 blog.title,
//                 style: const TextStyle(
//                   color: Colors.white,
//                   fontWeight: FontWeight.bold,
//                   fontSize: 24,
//                 ),
//               ),
//               const SizedBox(height: 20),
//               // Display the author information
//               Row(
//                 children: [
//                   CircleAvatar(
//                     backgroundImage: AssetImage(
//                       blog.authorImage?.isNotEmpty == true 
//                         ? blog.authorImage! 
//                         : 'assets/profile_page.png',
//                     ),
//                     radius: 24,
//                   ),
//                   const SizedBox(width: 10),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         blog.authorName,
//                         style: const TextStyle(color: Colors.grey),
//                       ),
//                       Text(
//                         "${blog.getFormattedDate()} • ${blog.minutesToRead} min read",
//                         style: const TextStyle(color: Colors.grey),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 20),
//               const Text(
//                 "Summary",
//                 style: TextStyle(
//                     color: Colors.white,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 18),
//               ),
//               const SizedBox(height: 10),
//               Text(
//                 blog.summary,
//                 style: const TextStyle(color: Colors.grey),
//               ),
//               const SizedBox(height: 30),
//               const Text(
//                 "Content",
//                 style: TextStyle(
//                     color: Colors.white,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 18),
//               ),
//               const SizedBox(height: 20),
//               Text(
//                 blog.content,
//                 style: const TextStyle(color: Colors.grey),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
