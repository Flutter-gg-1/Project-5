import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:project5/data/all_posts.dart';
import 'package:project5/data/all_users.dart';
import 'package:project5/extensions/screen_push.dart';
import 'package:project5/models/post.dart';
import 'package:project5/models/user.dart';
import 'package:project5/screens/add_post_screen.dart';
import 'package:project5/screens/user_screen_navigator.dart';
import 'package:project5/screens/view_post_screen.dart';
import 'package:project5/widgets/cards/post_card.dart';
import 'package:project5/widgets/images_carousel.dart';

class FeedScreen extends StatefulWidget {
  final User? user;
  const FeedScreen({super.key, this.user});

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  // get lists
  List<String> categories = GetIt.I.get<AllPosts>().categories;
  List<Post> posts = GetIt.I.get<AllPosts>().posts;

  // get current user (if exist)
  User? user = GetIt.I.get<AllUsers>().currentUser;
  
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
        backgroundColor: const Color(0xff111111),
        appBar: AppBar(
          foregroundColor: Colors.white,
          backgroundColor: const Color(0xff1e1e1e),
          leading: const Icon(Icons.list,size: 28,),
          actions: [
            IconButton(
              onPressed: () => Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => UserScreenNavigator(goTo: 1)),
                (predicate)=>false
              ),
              icon: const Icon(Icons.search,size: 28,)
            ),
            user!=null ? IconButton(
              onPressed: () {
                context.push(
                  target: const AddPostScreen(),
                  saveData: (p0){
                  if(p0==true) {
                    setState(() {});
                  }
                });
              },
              icon: const Icon(Icons.add,size: 28,color: Colors.white,)
            )
            : const SizedBox()
          ],
          bottom: TabBar(
            labelColor: Colors.white,
            labelPadding: const EdgeInsets.symmetric(vertical: 16),
            labelStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            unselectedLabelStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            unselectedLabelColor: const Color(0xff888888),
            indicatorColor: const Color(0xffdd403c),
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorWeight: 3,
            tabs: List.generate(categories.length, (index){
                return Text(categories[index]);
            })
          )
        ),
        body: TabBarView(
          children: List.generate(categories.length, (index){
            String currentCategory = categories[index];
            return ListView.builder(
              itemCount: 1,
              itemBuilder: (context, index) {
                List<Post> categoryPosts = GetIt.I.get<AllPosts>().posts.where((post)=>post.category==currentCategory).toList();
                return Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      ImagesCarousel(images: GetIt.I.get<AllPosts>().getCarousel(category: currentCategory)),
                      const SizedBox(height: 12,),
                      Divider(thickness: 1, color: Colors.white.withOpacity(.1),),
                      const SizedBox(height: 12,),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Top Stories", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w700)),
                          Text("See all", style: TextStyle(color: Color(0xff888888), fontSize: 12, fontWeight: FontWeight.w600)),
                        ],
                      ),
                      const SizedBox(height: 12,),
                      Column(
                        children: List.generate(categoryPosts.length, (postIndex){
                          Post post = categoryPosts[postIndex];
                          return Column(
                            children: [
                              PostCard(
                                post: post,
                                onTap: (){
                                  context.push(
                                    target: ViewPostScreen(
                                      post: post,
                                      onSave: () {
                                        post.isSaved ?
                                        GetIt.I.get<AllPosts>().removeFromUserSavedPosts(post: post)
                                        : GetIt.I.get<AllPosts>().addToUserSavedPosts(post: post);
                                        post.isSaved = !post.isSaved;
                                        setState(() {});
                                      },
                                    ),
                                    saveData: (p0) {
                                      if(p0==true){
                                        setState(() {});
                                      }
                                    },
                                  );
                                },
                                onSave: () {
                                  post.isSaved ?
                                  GetIt.I.get<AllPosts>().removeFromUserSavedPosts(post: post)
                                  : GetIt.I.get<AllPosts>().addToUserSavedPosts(post: post);
                                  post.isSaved = !post.isSaved;
                                  setState(() {});
                                },
                              ),
                              const SizedBox(height: 12,)
                            ],
                          );
                        }),
                      )
                    ],
                  ),
                );
              },
            );
          })
        ),
      ),
    );
  }
}