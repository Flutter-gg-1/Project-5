import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:project5/data_layer/blog_data.dart';
import 'package:project5/data_layer/user_data.dart';
import 'package:project5/screens/log_in_screen.dart';
import 'package:project5/screens/update_stories_detail.dart';
import 'package:project5/widgets/custom_elevated_button.dart';
import '../../widgets/custom_text/custom_text.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff111111),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomText(
                  text: "Account",
                  color: Colors.white,
                  size: 20,
                  fontWeight: FontWeight.bold,
                ),
                const SizedBox(
                  height: 30,
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Container(
                    height: 56,
                    width: 56,
                    decoration: BoxDecoration(
                        color: const Color(0xffFFFFFF),
                        borderRadius: BorderRadius.circular(5)),
                    child: Image.asset(
                      "assets/Vector-6.png",
                      scale: 3,
                    ),
                  ),
                  title: const CustomText(
                    text: "Kyle Barr",
                    color: Color(0xffB8B8B8),
                    size: 14,
                    fontWeight: FontWeight.w500,
                  ),
                  subtitle: const CustomText(
                    text: "Software developer",
                    color: const Color(0xffB8B8B8),
                    size: 10,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 45,
                ),
                const CustomText(
                  text: "My Blogs",
                  color: Colors.white,
                  size: 20,
                  fontWeight: FontWeight.bold,
                ),
                Column(
                    children: GetIt.I.get<BlogData>().blogData.map((e) {
                  return Container(
                    margin: EdgeInsets.only(top: 10),
                    height: 90,
                    width: 400,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: const Color(0xff1E1E1E)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Image.asset("assets/google_small.png"),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, bottom: 50),
                                child: CustomText(
                                    text: e.title, color: Colors.white, size: 11),
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(left: 150, top: 25),
                                    child: IconButton(
                                        onPressed: () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) {
                                            return UpdateStoriesDetail(id: e.id);
                                          }));
                                        },
                                        icon: const Icon(
                                          Icons.edit_outlined,
                                          color: Colors.white,
                                        )),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 25),
                                    child: IconButton(
                                        onPressed: () {
                                          GetIt.I
                                              .get<BlogData>()
                                              .removeBlog(id: e.id);
                                              setState(() {
                                              });
                                        },
                                        icon: const Icon(
                                          Icons.delete_outline,
                                          color: Color(0xffDD403C),
                                        )),
                                  ),
                                ],
                                
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList()),
                Padding(
                  padding: const EdgeInsets.only(top: 350),
                  child: CustomElevatedButton(
                    text: "Logout",
                    onPressed: () {
                      GetIt.I.get<UserData>().logOut();
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) {
                        return const LogInScreen();
                      }));
                      setState(() {});
                    },
                    textColor: const Color(0xffDD403C),
                    backgroundColor: Colors.white,
                    height: 50,
                    width: 255,
                    fontSize: 24,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
