import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:pro_5/data_handle/models/blog_data_model.dart';
import 'package:pro_5/page/blog_contant_page.dart';

class BlogProfileWidget extends StatefulWidget {
  const BlogProfileWidget({super.key, required this.blogDataModel,required  this.onTapDel,required this.onTapEdit});

  final BlogDataModel blogDataModel;


 final  Function()? onTapDel;
 final  Function()? onTapEdit;
  @override
  State<BlogProfileWidget> createState() => _BlogProfileWidgetState();
}

class _BlogProfileWidgetState extends State<BlogProfileWidget> {
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
          height: 102,
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
                    Padding(
                      padding: const EdgeInsets.only(bottom: 25),
                      child: SizedBox(
                        width: 220,
                        child: Text(
                          overflow: TextOverflow.ellipsis,
                          widget.blogDataModel.title,
                          style: GoogleFonts.inter(
                              color: const Color(0xffE8E8E8),
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                      ),
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
                    const Spacer(
                      flex: 1,
                    ),
                    const SizedBox(
                      width: 10,
                    ),

                    GestureDetector(

                      onTap:  widget.onTapEdit ,
                      child: const Icon(
                        FontAwesome.pencil_solid,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 10,),
                    GestureDetector(
                      onTap: widget.onTapDel,
                      child: const Icon(
                        FontAwesome.trash_can,
                        color: Colors.red,
                      ),
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
