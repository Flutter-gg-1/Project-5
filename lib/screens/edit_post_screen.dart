import 'package:flutter/material.dart';
import 'package:project5/models/post.dart';

class EditPostScreen extends StatefulWidget {
  final Post post;
  final TextEditingController newTitleController;
  final TextEditingController newSummaryController;
  final TextEditingController newContentController;
  const EditPostScreen({super.key, required this.post, required this.newTitleController, required this.newSummaryController, required this.newContentController});

  @override
  State<EditPostScreen> createState() => _EditPostScreenState();
}

class _EditPostScreenState extends State<EditPostScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff111111),
      appBar: AppBar(
        backgroundColor: Color(0xff111111),
        foregroundColor: Colors.white,
        leading: IconButton(onPressed: ()=>Navigator.pop(context), icon: const Icon(Icons.arrow_back_ios)),
        actions: [TextButton(onPressed: ()=>Navigator.pop(context,true), child: Text("Save", style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700, color: Colors.white),))],
      ),
      body: Padding(
        padding: const EdgeInsets.all(21),
        child: ListView(
          children: [
            SizedBox(height: 29,),
            Text("Title", style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700, color: Colors.white),),
            SizedBox(height: 7,),
            TextField(
              minLines: 1,
              maxLines: 2,
              style: TextStyle(fontSize: 14, fontWeight:FontWeight.w400, color: Colors.white),
              controller: widget.newTitleController,
              decoration: InputDecoration(
                border: OutlineInputBorder(borderSide: BorderSide.none,borderRadius: BorderRadius.circular(8)),
                filled: true,
                fillColor: Colors.white.withOpacity(0.12)
              ),
            ),
            SizedBox(height: 29,),
            Text("Summary", style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700, color: Colors.white),),
            SizedBox(height: 7,),
            TextField(
              minLines: 1,
              maxLines: null,
              style: TextStyle(fontSize: 14, fontWeight:FontWeight.w400, color: Colors.white),
              controller: widget.newSummaryController,
              decoration: InputDecoration(
                border: OutlineInputBorder(borderSide: BorderSide.none,borderRadius: BorderRadius.circular(8)),
                filled: true,
                fillColor: Colors.white.withOpacity(0.12)
              ),
            ),
            SizedBox(height: 29,),
            Text("Content", style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700, color: Colors.white),),
            SizedBox(height: 7,),
            TextField(
              onTapOutside: (e) => FocusManager.instance.primaryFocus?.unfocus(),
              minLines: 1,
              maxLines: null,
              style: TextStyle(fontSize: 14, fontWeight:FontWeight.w400, color: Colors.white),
              controller: widget.newContentController,
              decoration: InputDecoration(
                border: OutlineInputBorder(borderSide: BorderSide.none,borderRadius: BorderRadius.circular(8)),
                filled: true,
                fillColor: Colors.white.withOpacity(0.12)
              ),
            ),
          ],
        ),
      ),
    );
  }
}