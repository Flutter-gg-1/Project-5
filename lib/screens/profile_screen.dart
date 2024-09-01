import 'package:blog_app/data_layer/blog_data.dart';
import 'package:blog_app/data_layer/user_data.dart';
import 'package:blog_app/helper/extension/color_ext.dart';
import 'package:blog_app/helper/extension/nav.dart';
import 'package:blog_app/models/blog_model.dart';
import 'package:blog_app/screens/edit_news_screen.dart';
import 'package:blog_app/screens/login_screen.dart';
import 'package:blog_app/screens/news_screen.dart';
import 'package:blog_app/widgets/buttons/custom_button.dart';
import 'package:blog_app/widgets/cards/user_data_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get_it/get_it.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late UserData userData;
  late BlogData blogData;

  @override
  void initState() {
    super.initState();
    userData = GetIt.I.get<UserData>();
    blogData = GetIt.I.get<BlogData>();
  }

  void _editBlog(BlogModel blog) {
    context.push(screen: EditNewsScreen(blog: blog));
    setState(() {});
  }

  void _removeBlog(BlogModel blog) {
    userData.removeBlogFromUserNews(blog);
    blogData.removeBlog(blog);
    setState(() {});
  }

  void _logout() async {
    await userData.logout();
    context.pushAndRemoveUntil(screen: const LoginScreen());
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
                "Account",
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
              child: Container(
                height: 191,
                width: 337,
                decoration: BoxDecoration(
                  color: ColorExt.leaden,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'You are not logged in yet',
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        color: ColorExt.white,
                      ),
                    ),
                    CustomButton(
                      foregroundColor: ColorExt.violet,
                      backgroundColor: ColorExt.white,
                      title: "Login",
                      height: 55,
                      width: 255,
                      onPressed: () {
                        context.push(screen: const LoginScreen());
                      },
                    ),
                  ],
                ),
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  UserDataCard(name: currentUser.userName),
                  const SizedBox(height: 20),
                  Text(
                    "My Blogs",
                    style: GoogleFonts.inter(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: ColorExt.white,
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: currentUser.userNews.length,
                      itemBuilder: (context, index) {
                        final blog = currentUser.userNews[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Card(
                            color: ColorExt.leaden,
                            child: ListTile(
                              contentPadding: const EdgeInsets.all(10),
                              leading: Image.asset(
                                blog.image,
                                width: 50,
                                height: 50,
                                fit: BoxFit.cover,
                              ),
                              title: Text(
                                blog.title,
                                style: GoogleFonts.inter(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: ColorExt.white,
                                ),
                              ),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    icon:
                                        Icon(Icons.edit, color: ColorExt.white),
                                    onPressed: () => _editBlog(blog),
                                  ),
                                  IconButton(
                                    icon:
                                        Icon(Icons.delete, color: ColorExt.red),
                                    onPressed: () => _removeBlog(blog),
                                  ),
                                ],
                              ),
                              onTap: () {
                                context.push(
                                    screen: FullNewsScreen(blog: blog));
                              },
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 80.0),
                    child: CustomButton(
                      foregroundColor: ColorExt.red,
                      backgroundColor: ColorExt.white,
                      title: "LogOut",
                      height: 55,
                      width: 255,
                      onPressed: _logout,
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
