import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:news_feed_app/data/post_data.dart';
import 'package:news_feed_app/widgets/custom_textfeild.dart';

class EditPost extends StatefulWidget {
  const EditPost({super.key, required this.postId});

  final int postId;

  @override
  _EditPostState createState() => _EditPostState();
}

class _EditPostState extends State<EditPost> {
  late TextEditingController titleController;
  late TextEditingController summaryController;
  late TextEditingController contentController;

  @override
  void initState() {
    super.initState();
    final postData = GetIt.I.get<PostData>();
    final post = postData.postsList.firstWhere((p) => p.id == widget.postId);
    
    // Initialize controllers with post data
    titleController = TextEditingController(text: post.title);
    summaryController = TextEditingController(text: post.summary);
    contentController = TextEditingController(text: post.content);
  }

  @override
  void dispose() {
    titleController.dispose();
    summaryController.dispose();
    contentController.dispose();
    super.dispose();
  }

  void savePost() {
    GetIt.I.get<PostData>().updatePost(
      widget.postId,
      title: titleController.text,
      summary: summaryController.text,
      content: contentController.text,
    );
    
    // Show a confirmation message
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Post updated successfully!')),
    );

    Navigator.pop(context, true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff111111),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: const Color.fromARGB(0, 33, 149, 243),
        actions: [
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(const Color(0xff111111)),
            ),
            onPressed: savePost, // Call save function
            child: const Text(
              'Save',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Color(0xffffffff)),
            ),
          )
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
          child: ListView(
            children: [
              TextContainer(
                title: 'Title',
                hint: '',
                titleSize: 16,
                titleWeight: FontWeight.w700,
                unlimittedLines: true,
                textController: titleController,
              ),
              const SizedBox(height: 30),
              TextContainer(
                title: 'Summary',
                hint: '',
                titleSize: 16,
                titleWeight: FontWeight.w700,
                unlimittedLines: true,
                textController: summaryController,
              ),
              const SizedBox(height: 30),
              TextContainer(
                title: 'Content',
                hint: '',
                titleSize: 16,
                titleWeight: FontWeight.w700,
                unlimittedLines: true,
                textController: contentController,
              ),
            ],
          ),
        ),
      ),
    );
  }
}