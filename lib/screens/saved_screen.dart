import 'package:blog_app/data_layer/user_data.dart';
import 'package:blog_app/helper/extension/color_ext.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class SavedScreen extends StatelessWidget {
  const SavedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userData = GetIt.I.get<UserData>();
    return  Scaffold( backgroundColor: ColorExt.background,
    body: 
    ListView.builder(
        itemCount: userData.savedBlogs.length,
        itemBuilder: (context, index) {
          final blog = userData.savedBlogs[index];
          return ListTile(
            title: Text(blog.title),
            subtitle: Text(blog.writer),
            trailing: Text(blog.date),
            onTap: () {
            
            },
          );
        },
      ),
    );

  }
}