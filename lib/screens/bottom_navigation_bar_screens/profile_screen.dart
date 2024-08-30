import 'package:flutter/material.dart';
import 'package:project5/widgets/custom_elevated_button.dart';
import '../../widgets/custom_text/custom_text.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff111111),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomText(text: "Account", color: Colors.white, size: 20, fontWeight: FontWeight.bold,),
              const SizedBox(height: 30,),
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: Container(
                  height: 56,
                  width: 56,
                  decoration: BoxDecoration(
                    color: const Color(0xffFFFFFF),
                    borderRadius: BorderRadius.circular(5)
                  ),
                  child: Image.asset("assets/Vector-6.png", scale: 3,),
                ),
                title: const CustomText(text: "Kyle Barr", color: Color(0xffB8B8B8), size: 14, fontWeight: FontWeight.w500,),
                subtitle: const CustomText(text: "Software developer", color: const Color(0xffB8B8B8), size: 10, fontWeight: FontWeight.w500,),
              ),
              const SizedBox(height: 45,),
              const CustomText(text: "My Blogs", color: Colors.white, size: 20, fontWeight: FontWeight.bold,),
              Container(
                height: 120,
                width: 400,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: Colors.transparent),
                child: 
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Column(
                    children: [
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: Image.asset("assets/google_small.png"),
                        title: const CustomText(text: "Now Google’s Bard AI can talk & respond to visual prompts", color: Colors.white, size: 14, fontWeight: FontWeight.bold,), 
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(onPressed: (){}, icon: const Icon(Icons.edit_outlined, color: Colors.white,)),
                          IconButton(onPressed: (){}, icon: const Icon(Icons.delete_outline, color: Colors.red,)),
                        ],
                      ),
                    ],
                  ),
                ),),
                Padding(
                  padding: const EdgeInsets.only(top: 350),
                  child: CustomElevatedButton(text: "Logout", onPressed: () {
                  }, textColor: Color(0xffDD403C), backgroundColor: Colors.white, height: 50, width: 255, fontSize: 24,),
                )
            ],
          ),
        ),
      ),
    );
  }
}