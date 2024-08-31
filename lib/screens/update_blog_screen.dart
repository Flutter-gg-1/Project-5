import 'package:blog_app_project/helper/extensions/screen.dart';
import 'package:flutter/material.dart';

class UpdateBlogScreen extends StatelessWidget {
  const UpdateBlogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff111111),
      appBar: AppBar(
        backgroundColor: const Color(0xff111111),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          TextButton(
              onPressed: () {},
              child: const Text(
                'Save',
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: context.getHeight() / 19,
            ),
            SizedBox(
              height: context.getHeight() / 74,
            ),
            const Row(
              children: [
                Text(
                  'Title',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 17,
                      fontFamily: 'Inter'),
                ),
              ],
            ),
            SizedBox(
              height: context.getHeight() / 74,
            ),
            const CustomTextFelid(
              minLines: 2,
              content:
                  'Now Google\'s Bard AI Chatbot can talk & respond to visual prompts!',
            ),
            SizedBox(
              height: context.getHeight() / 30,
            ),
            const Row(
              children: [
                Text(
                  'Summary',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 17,
                      fontFamily: 'Inter'),
                ),
              ],
            ),
            SizedBox(
              height: context.getHeight() / 74,
            ),
            const CustomTextFelid(
              minLines: 4,
              content:
                  'Google is adding some new features to its Bard AI chatbot, including the ability for Bard to speak its answers to you and for it to .....',
            ),
            SizedBox(
              height: context.getHeight() / 30,
            ),
            const Row(
              children: [
                Text(
                  'Content',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 17,
                      fontFamily: 'Inter'),
                ),
              ],
            ),
            SizedBox(
              height: context.getHeight() / 74,
            ),
            const CustomTextFelid(
              minLines: 18,
              content:
                  'The feature that lets you add images to prompts is something that Google first showed off at its I/O conference in May. In one example, Google suggested you could use this to ask for help writing a funny caption about a picture of two dogs. Google says the feature is now available in English and is expanding to new languages “soon.” Google is introducing a few other new features, too, including the ability to pin and rename conversations, share responses with your friends, and change the tone and style of the responses you get back from Bard. Google first opened up access to Bard in March, but at the time, it was available only in the US and the UK. The company has been rolling out the chatbot to many more countries since then, and that now includes “all countries in the EEA [European Economic Area] and Brazil,” Google spokesperson Jennifer Rodstrom tells The Verge. That expansion in Europe is a notable milestone; the company\'s planned Bard launch in the EU was delayed due to privacy concerns.',
            ),
          ],
        ),
      )),
    );
  }
}

class CustomTextFelid extends StatelessWidget {
  const CustomTextFelid(
      {super.key, this.controller, this.minLines = 1, required this.content});
  final TextEditingController? controller;
  final int? minLines;
  final String content;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: const Color(0xffffffff).withOpacity(0.01)),
      constraints: BoxConstraints(maxWidth: context.getWidth()),
      width: context.getWidth(divide: 1),
      child: TextFormField(
        initialValue: content,
        style: const TextStyle(color: Colors.white),
        minLines: minLines,
        maxLines: (minLines!),
        controller: controller,
        decoration: InputDecoration(
          border: UnderlineInputBorder(borderRadius: BorderRadius.circular(8)),
          filled: true,
          fillColor: const Color(0xffffffff).withOpacity(0.12),
        ),
      ),
    );
  }
}
