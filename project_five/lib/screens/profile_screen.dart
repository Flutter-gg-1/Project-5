import 'package:blogs_app/screens/edit_blog_screen.dart';
import 'package:blogs_app/widgets/blogs_list.dart';
import 'package:blogs_app/widgets/guest_login_prompt.dart';
import 'package:blogs_app/widgets/logout_button.dart';
import 'package:blogs_app/widgets/no_blogs_available.dart';
import 'package:blogs_app/widgets/user_profile_tile.dart';
import 'package:flutter/material.dart';
import '../helper/locator.dart';
import '../data/services/auth_service.dart';
import '../data/services/blog_service.dart';
import '../models/blog.dart';
import 'package:get_storage/get_storage.dart';
import 'login_screen.dart';

class ProfilePage extends StatefulWidget {
  @override
  ProfilePageState createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {
  final BlogService blogService = locator<BlogService>();
  final AuthService authService = locator<AuthService>();
  final GetStorage storage = GetStorage();
  List<Blog> blogs = [];

  String username = '';
  @override
  void initState() {
    super.initState();
    username = storage.read('username') ?? 'No Username';

    loadBlogs();
  }

  void loadBlogs() {
    final allBlogs = blogService.getBlogs();
    setState(() {
      blogs = allBlogs.where((blog) => blog.authorName == username).toList();
    });
  }

  void editBlog(Blog blog) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditBlogScreen(blog: blog),
      ),
    );
  }

  void deleteBlog(Blog blog) {
    setState(() {
      blogs.remove(blog);
      blogService.deleteBlog(blog.id);
    });
  }

  void navigateToLogin() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => LoginScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    bool isGuest = authService.isGuest();
    final String username = storage.read('username') ?? 'No Username';

    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (isGuest)
              GuestLoginPrompt(onLoginPressed: navigateToLogin)
            else
              Expanded(
                child: ListView(
                  children: <Widget>[
                    buildSectionHeader('Account'),
                    SizedBox(height: 20),
                    buildSectionHeader('My Blogs'),
                    UserProfileTile(username: username),
                    blogs.isEmpty
                        ? NoBlogsAvailable()
                        : BlogsList(
                            blogs: blogs,
                            onEdit: editBlog,
                            onDelete: deleteBlog),
                  ],
                ),
              ),
            if (!isGuest)
              LogoutButton(
                onPressed: () {
                  authService.logout();
                  navigateToLogin();
                },
              ),
          ],
        ),
      ),
    );
  }

  Widget buildSectionHeader(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w700,
        color: Colors.white,
      ),
    );
  }
}
