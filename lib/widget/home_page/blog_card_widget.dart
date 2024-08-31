import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pro_5/data_handle/git_it/setup.dart';
import 'package:pro_5/data_handle/models/app_model.dart';
import 'package:pro_5/data_handle/models/blog_data_model.dart';
import 'package:pro_5/page/blog_contant_page.dart';

class BlogCardWidget extends StatefulWidget {
  const BlogCardWidget({
    super.key,
    required this.blogDataModel,
  });

  final BlogDataModel blogDataModel;

  @override
  State<BlogCardWidget> createState() => _BlogCardWidgetState();
}

class _BlogCardWidgetState extends State<BlogCardWidget> {
  bool isLiked = false;

  @override
  void initState() {
    isLiked =
        getIt.get<AppModel>().isBlogLike(blogDataModel: widget.blogDataModel);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) {
              return BlogContantPage(
                blogDataModel: widget.blogDataModel,
              );
            },
          )).then((onValue) {
            setState(() {});
          });
        },
        child: Container(
          width: 340,
          height: 123,
          decoration: BoxDecoration(
              color: const Color(0xff1E1E1E),
              borderRadius: BorderRadius.circular(8)),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8, top: 8),
                child: Row(
                  children: [
                    Image.asset(
                      // "asset/img/STK156_Instagram_threads_2 2.png",
                      widget.blogDataModel.img,
                      width: 75,
                      height: 62,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.blogDataModel.userName,
                            style: GoogleFonts.inter(
                                color: const Color(0xff888888),
                                fontWeight: FontWeight.bold,
                                fontSize: 13)),
                        SizedBox(
                          width: 240,
                          child: Text(
                            overflow: TextOverflow.ellipsis,
                            widget.blogDataModel.title,
                            style: GoogleFonts.inter(
                                color: const Color(0xffE8E8E8),
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  children: [
                    Text(
                      "${widget.blogDataModel.date} • ${widget.blogDataModel.readingMin}",
                      style: GoogleFonts.inter(
                          color: const Color(0xff888888),
                          fontWeight: FontWeight.bold,
                          fontSize: 11),
                    ),
                    const Spacer(
                      flex: 1,
                    ),
                    GestureDetector(
                      onTap: () {
                        if (isLiked == true) {
                          getIt.get<AppModel>().updateBlogLike(
                              doLike: isLiked, blog: widget.blogDataModel);
                          isLiked = false;
                        } else {
                          getIt.get<AppModel>().updateBlogLike(
                              doLike: isLiked, blog: widget.blogDataModel);
                          isLiked = true;
                        }

                        setState(() {});

                        print(widget.blogDataModel.userLiked);
                      },
                      child: Icon(
                        Icons.bookmark_outline,
                        color: isLiked == false
                            ? const Color(0xff888888)
                            : Colors.white,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Icon(
                      Icons.more_vert,
                      color: Color(0xff888888),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
