import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pro_5/data_handle/git_it/setup.dart';
import 'package:pro_5/data_handle/models/app_model.dart';
import 'package:pro_5/data_handle/models/blog_data_model.dart';
import 'package:pro_5/data_handle/models/user_model.dart';
import 'package:pro_5/page/edit_blog_page.dart';
import 'package:pro_5/page/login_page.dart';
import 'package:pro_5/widget/button_widget.dart';
import 'package:pro_5/widget/home_page/blog_card_widget.dart';
import 'package:pro_5/widget/profile_page/blog_profile_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  List<BlogDataModel> userblog = [];

  UserModel user = getIt.get<AppModel>().userLogin!;

  @override
  void initState() {
    
    userblog = getIt.get<AppModel>().showUserBlog();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff111111),
      appBar: AppBar(
        backgroundColor: const Color(0xff111111),
        title: Padding(
          padding: const EdgeInsets.only(top: 38, left: 10),
          child: Text(
            "Account",
            style: GoogleFonts.inter(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: user.isGust == true
          ? Center(
              child: Container(
                width: 330,
                height: 180,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: const Color(0xff1E1E1E)),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      "You are not logged in yet",
                      style: GoogleFonts.inter(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 13),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    ButtonWidget(
                      backColor: const Color(0xffFFFFFF),
                      texcolor: const Color(0xffBDA6F5),
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) {
                            getIt.get<AppModel>().userLogout();
                            return const LoginPage();
                          },
                        ));
                      },
                    )
                  ],
                ),
              ),
            )
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 24),
                    child: Row(
                      children: [
                        Container(
                          width: 56,
                          height: 56,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(6)),
                          child: Image.asset(
                            "asset/img/Vector (5)1.png",
                            fit: BoxFit.contain,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              user.name,
                              style: GoogleFonts.inter(
                                  color: const Color(0xffB8B8B8),
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Software developer",
                              style: GoogleFonts.inter(
                                  fontSize: 12,
                                  color: const Color(0xffB8B8B8),
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 19),
                    child: Text("My Blogs",
                        style: GoogleFonts.inter(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Column(
                    children: userblog.map(
                      (e) {
                        return BlogProfileWidget(
                            onTapDel: () {
                              getIt
                                  .get<AppModel>()
                                  .blogDel(blog: e, userList: userblog);

                              setState(() {});
                            },
                            onTapEdit: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) {
                                  return EditBlogPage(
                                    blogDataModel: e,
                                  );
                                },
                              )).then((onValue) {
                                if (onValue == true) {
                                  setState(() {});
                                }
                              });
                            },
                            blogDataModel: e);
                      },
                    ).toList(),
                  ),
                  const SizedBox(
                    height: 200,
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: ButtonWidget(
                      tex: "Logout",
                      backColor: const Color(0xffFFFFFF),
                      texcolor: const Color(0xffDD403C),
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) {
                            getIt.get<AppModel>().userLogout();

                            return const LoginPage();
                          },
                        ));
                      },
                    ),
                  )
                ],
              ),
            ),
    );
  }
}
