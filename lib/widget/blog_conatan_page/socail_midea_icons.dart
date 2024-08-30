





import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class SocailMideaIcons extends StatelessWidget {
  const SocailMideaIcons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 20),
      child: Row(
       children: [
      
         Icon(EvaIcons.facebook,color: Color(0xffCFCFCF),),
         SizedBox(width: 10,),
         Icon(EvaIcons.twitter,color: Color(0xffCFCFCF)),
         SizedBox(width: 10,),
         Icon(EvaIcons.share,color: Color(0xffCFCFCF))
       ],
      ),
    );
  }
}
